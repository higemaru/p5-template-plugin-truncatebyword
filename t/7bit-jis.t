use strict;
use lib qw(lib ../lib);
use Template::Test;
use Template::Plugin::TruncateByWord;

test_expect(\*DATA);


__DATA__

-- test --
[% USE TruncateByWord '7bit-jis' -%]
[% 'abcdefg' | truncate_by_word(4) %]
-- expect --
abcd

-- test --
[% USE TruncateByWord '7bit-jis' -%]
[% '$B$"$$$&$($*(B' | truncate_by_word(3) %]
-- expect --
$B$"$$$&(B

-- test --
[% USE TruncateByWord '7bit-jis' -%]
[% '$B$"$$(Ba$B$&$((Bb$B$*(Bcdefg' | truncate_by_word(3) %]
-- expect --
$B$"$$(Ba

-- test --
[% USE TruncateByWord '7bit-jis' -%]
[% '$B$"$$(Ba$B$&$((Bb$B$*(Bcdefg' | truncate_by_word %]
-- expect --
$B$"$$(Ba$B$&$((Bb$B$*(Bcdefg

-- test --
[% USE TruncateByWord '7bit-jis' -%]
[% '$B$"$$(Ba$B$&$((Bb$B$*(Bcdefg' | truncate_by_word(5,'...') %]
-- expect --
$B$"$$(Ba$B$&$((B...

-- test --
[% USE TruncateByWord '7bit-jis' -%]
[% '$B$"$$(Ba$B$&$((Bb$B$*(Bcdefg' | truncate_by_word(36,'...') %]
-- expect --
$B$"$$(Ba$B$&$((Bb$B$*(Bcdefg

-- test --
[% USE TruncateByWord('7bit-jis', name='my_truncate') -%]
[% '$B$"$$(Ba$B$&$((Bb$B$*(Bcdefg' | my_truncate(3) %]
-- expect --
$B$"$$(Ba

-- test --
[% USE TruncateByWord '7bit-jis' name='my_truncate' -%]
[% FILTER my_truncate(5,'..') -%]
$B$"$$(Ba$B$&$((Bb$B$*(Bcdefg
[% END %]
-- expect --
$B$"$$(Ba$B$&$((B..

-- test --
[% USE TruncateByWord enc='7bit-jis' name='my_truncate' -%]
[% FILTER my_truncate(5,'..') -%]
$B$"$$(Ba$B$&$((Bb$B$*(Bcdefg
[% END %]
-- expect --
$B$"$$(Ba$B$&$((B..
