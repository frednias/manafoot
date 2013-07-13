{% extends "index.tpl" %}

{% block body %}
<table class="table table-striped table-bordered table-hover table-condensed">
<tr>
    <th>tea_id</th>
    <th>tea_name</th>
    <th>ass_name</th>
    <th>tea_gender</th>
    <th>elo_points</th>
</tr>
{% for tt in team %}
<tr>
    <td><a href='/team/view/{{tt.tea_id}}'>{{ tt.tea_id }}</a></td>
    <td><a href='/team/view/{{tt.tea_id}}'>{{ tt.tea_name }}</a></td>
    <td><a href='/association/view/{{tt.tea_ass_id}}'>{{tt.ass_name}}</a></td>
    <td><a href='/team/view/{{tt.tea_id}}'>{{ tt.tea_gender }}</a></td>
    <td><a href='/elo'>{{tt.elo_points}}</a>
</tr>
{% endfor %}
</table>
{% endblock %}

