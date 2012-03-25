use inc::Module::Install;
name 'Template-Plugin-TruncateByWord';
perl_version '5.008';
all_from 'lib/Template/Plugin/TruncateByWord.pm';

requires 'Template';
requires 'Encode';

use_standard_tests;

auto_include;
WriteAll;
