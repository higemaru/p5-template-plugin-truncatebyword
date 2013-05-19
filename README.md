# NAME

Template::Plugin::TruncateByWord - A Template Toolkit filter to truncate not the number of bytes but characters

# SYNOPSIS

    # result is 'ab'
    [% USE TruncateByWord %]
    [% 'abcdefg' | truncate_by_word(2) %]

    # result is 'abc....'
    [% USE TruncateByWord %]
    [% FILTER truncate_by_word(3,'....') %]
    abcdefg
    [% END %]

    # default charset = 'utf8'. you can change this.
    # result is 'abcd'
    [% USE TruncateByWord 'euc-jp' %]
    [% FILTER truncate_by_word(4) %]
    abcdefg
    [% END %]

# DESCRIPTION

Template::Plugin::TruncateByWord is a filter plugin for Template Toolkit which truncate text not the number of bytes but the number of characters.

# BUGS

If found, please Email me. I tested utf8, euc-jp, shiftjis, 7bit-jis, big5, and euc-kr. Please send me more test cases.

# SEE ALSO

[Template](http://search.cpan.org/perldoc?Template), [Template::Plugin::Filter](http://search.cpan.org/perldoc?Template::Plugin::Filter), and t/\*.t

# AUTHOR

User & KAWABATA Kazumichi (Higemaru) <kawabata@cpan.org>

# COPYRIGHT AND LICENSE

Copyright (C) 2008- KAWABATA Kazumichi

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.


