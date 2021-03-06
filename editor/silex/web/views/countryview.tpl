{% extends "index.tpl" %}

{% block body %}
<table class="table table-striped table-bordered table-hover table-condensed">
<tr><th>cou_id</th><th>cou_name</th></tr>
{% for cou in country %}
<tr><td><a href='/country/view/{{cou.cou_id}}'>{{ cou.cou_id }}</a></td><td><a href='/country/view/{{cou.cou_id}}'>{{ cou.cou_name }}</a></td></tr>
{% endfor %}
</table>

Contains associations :
<table class="table table-striped table-bordered table-hover table-condensed">
<tr><th>ass_id</th><th>ass_name</th></tr>
{% for ass in association %}
<tr><td><a href='/association/view/{{ass.ass_id}}'>{{ ass.ass_id }}</a></td><td><a href='/association/view/{{ass.ass_id}}'>{{ ass.ass_name }}</a></td></tr>
{% endfor %}
</table>
{% endblock %}

