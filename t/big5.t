use strict;
use lib qw(lib ../lib);
use Template::Test;
use Template::Plugin::TruncateByWord;

test_expect(\*DATA);


__DATA__

-- test --
[% USE TruncateByWord 'big5' -%]
[% 'abcdefg' | truncate_by_word(4) %]
-- expect --
abcd

-- test --
[% USE TruncateByWord 'big5' -%]
[% '��ڽs�X�X' | truncate_by_word(3) %]
-- expect --
��ڽs

-- test --
[% USE TruncateByWord 'big5' -%]
[% '���a�s�Xb�Xcdefg' | truncate_by_word(3) %]
-- expect --
���a

-- test --
[% USE TruncateByWord 'big5' -%]
[% '���a�s�Xb�Xcdefg' | truncate_by_word %]
-- expect --
���a�s�Xb�Xcdefg

-- test --
[% USE TruncateByWord 'big5' -%]
[% '���a�s�Xb�Xcdefg' | truncate_by_word(5,'...') %]
-- expect --
���a�s�X...

-- test --
[% USE TruncateByWord 'big5' -%]
[% '���a�s�Xb�Xcdefg' | truncate_by_word(36,'...') %]
-- expect --
���a�s�Xb�Xcdefg

-- test --
[% USE TruncateByWord('big5', name='my_truncate') -%]
[% '���a�s�Xb�Xcdefg' | my_truncate(3) %]
-- expect --
���a

-- test --
[% USE TruncateByWord 'big5' name='my_truncate' -%]
[% FILTER my_truncate(5,'..') -%]
���a�s�Xb�Xcdefg
[% END %]
-- expect --
���a�s�X..

-- test --
[% USE TruncateByWord enc='big5' name='my_truncate' -%]
[% FILTER my_truncate(5,'..') -%]
���a�s�Xb�Xcdefg
[% END %]
-- expect --
���a�s�X..
