<% Data::Dumper::Dumper($m->req->session) %>

<%init>
$m->req->session->{count}++;
</%init>

