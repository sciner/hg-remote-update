#!/usr/bin/perl
use CGI;                           # module that simplifies grabbing parameters from query string
use strict;                        # to make sure your Perl code is well formed
print "Content-type:text/html\n\n<body style=\"background-color: #fff; background-image: linear-gradient(90deg, transparent 79px, #abced4 79px, #abced4 81px, transparent 81px), linear-gradient(#eee .1em, transparent .1em); background-size: 100% 1.2em;padding: 23px 89px; line-height: 19px;\"><h1 style=\"font-size: 42px; font-family: 'Open Sans', Arial;\">Mercurial remote update</h1><pre>";
my $cgi    = new CGI;
my %params = map { $_ => join("; ", split("\0", $cgi->Vars->{$_})) } $cgi->param;
# print $params{project};
system('sh', '/var/www/nginx/up.sh', "$params{host}", "$params{project}", "$params{user}", "$params{pwd}");
print "</body></html>";
