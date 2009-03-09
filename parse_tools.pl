#!/usr/bin/perl -w
use strict;

my %tools;
my %pce;
my %header;
my @headerTags = qw/audioObjectType samplingFrequencyIndex channelConfiguration/;
my @toolsTags = qw/DSE DRC IS MS PulseData TNS WndShapeSW PNS DepCoup Pred IndCoup/;
my @pceTags = qw/profile sampling_rate_idx front side back lfe coupling data.num_ele comment/;
my @samplingFreqTab = qw/96000 88200 64000 48000 44100 32000 24000 22050 16000 12000 11025 8000 7350 Undefined13 Undefined14 Escape/;
my @chanConfigTab = ( 0, 1, 2, 3, 4, 5, 5.1, 7.1);
my @AOTTab = qw/Null Main LC SSR LTP SBR/;
my %chanEleNames = ( "front" => ["SCE", "CPE"], "side" => ["SCE", "CPE"], "back" => ["SCE", "CPE"], "lfe" => ["LFE", "ERR"], "coupling" => ["CCE(D)", "CCE(I)"] );
my $samplingFreq, my $channels;
foreach(@headerTags) {
    $header{$_} = '';
}
foreach(@toolsTags) {
    $tools{$_} = 'no ';
}
foreach(@pceTags) {
    $pce{$_} = '';
}

my $name;
if ($#ARGV == 0) {
    $name = $ARGV[0];
}

my $state = "";
while (my $line = <STDIN>) {
    if ($state ne "") {
        if ($line =~ m/^\s/) {
            if ($state =~ m/^pce.(\w+)/) {
                my $loc = $1;
                my $tok = '(\d+)';
                if ($line =~ m/^\s+$tok\s+$tok\s+$tok/) {
                    $pce{$loc} .= "$1:$2:$3 ";
                }
            }
            $line = "";
        } else {
            $state = "";
        }
    }
    chomp($line);
    if ($line =~ m/^#/) {
        $line = substr($line, 2, -9);
        my @ltools = split(" ", $line);
        foreach (@ltools) {
            if (exists $tools{$_}) {
                $tools{$_} = 'yes';
            } else {
                die "Unexpected tool $_\n";
            }
        }
    } elsif ($line =~ m/^p->/) {
        $line = substr($line, 3);
        my @ltools = split(" ", $line);
        if ($#ltools > 0) {
            $pce{$ltools[0]} = $ltools[1];
        } else {
            $state = "pce.".$ltools[0];
        }
    } elsif ($line =~ m/^Comment: (.+)/) {
        $pce{'comment'} = $1;
    } elsif ($line =~ m/^(\w+)\s+(\w+)/) {
        if (exists $header{$1}) {
            $header{$1} = $2;
        }
    }
}

#inferred variables
my $pceIndex = $pce{'sampling_rate_idx'};
my $headerIndex = $header{'samplingFrequencyIndex'};
    $samplingFreq = $headerIndex ne '' ? $samplingFreqTab[$headerIndex] : '';
if ($pceIndex ne '' && $headerIndex != $pceIndex) {
    $samplingFreq .= " / ".$samplingFreqTab[$pceIndex];
}

$channels = $header{'channelConfiguration'};
$channels = $channels ne '' ? $chanConfigTab[$header{'channelConfiguration'}] : '';
my $pce_channels = 0;
my $pce_lfes = 0;
my $new = '';

foreach my $loc (('front','side','back')) {
foreach (split(" ",$pce{$loc})) {
    $_ =~ m/(\d+):(\d+):(\d+)/;
    $pce_channels = $pce_channels + 1 + $2;
    if ($2 != 0 && $2 != 1) { die ("Bizaaro channel"); }
    $new .= "$1-".$chanEleNames{$loc}[$2]."[$3] ";
}
$pce{$loc} = $new;
$new = '';
}

foreach (split(" ",$pce{'lfe'})) {
    $_ =~ m/(\d+):(\d+):(\d+)/;
    $pce_lfes = $pce_lfes + 1 + $2;
    if ($2) { die ("Bizaaro LFE"); }
    $new .= "$1-".$chanEleNames{'lfe'}[$2]."[$3] ";
}
$pce{'lfe'} = $new;
$new = '';

foreach (split(" ",$pce{'coupling'})) {
    $_ =~ m/(\d+):(\d+):(\d+)/;
    if    ($2 == 0) { $tools{'DepCoup'} = "yes"; }
    elsif ($2 == 1) { $tools{'IndCoup'} = "yes"; }
    else            { die ("Bizaaro Coupling"); }
    $new .= "$1-".$chanEleNames{'coupling'}[$2]."[$3] ";
}
$pce{'coupling'} = $new;
$new = '';

if ($channels) {
    if ($pce_lfes || $pce_channels) {
        if ($pce_lfes) {
            if ($channels ne "$pce_channels.$pce_lfes") {
                $channels.= " / $pce_channels.$pce_lfes";
            }
        } else {
            if($channels != $pce_channels) {
                $channels.= " / $pce_channels";
            }
        }
    }
} else {
    $channels = $pce_channels . ($pce_lfes ? ".$pce_lfes" : "");
}

my $AOT = $header{'audioObjectType'} ne '' ? $AOTTab[$header{'audioObjectType'}] : '';
if ($pce{'profile'} && $pce{'profile'}+1 != $header{'audioObjectType'}) {
    $AOT .= " / ".$AOTTab[$pce{'profile'}+1];
}

my $k;
print "| ";
if ($name) {
    print "$name || ";
}
print "$AOT || ";
print "$channels || ";
print "$samplingFreq || ";
foreach $k (@headerTags) {
   print "$header{$k} || ";
}
foreach $k (@toolsTags) {
   print "$tools{$k} || ";
}
foreach $k (@pceTags) {
   print "$pce{$k} || "
}
print "\n";
