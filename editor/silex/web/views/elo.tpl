{% extends "index.tpl" %}

{% block body %}
<table class="table table-striped table-bordered table-hover table-condensed">
<tr>
    <th>tea_name</th>
    <th>elo_points</th>
    <th>action</th>
</tr>
{% for e in elo %}
<tr>
    <td><a href='/team/view/{{e.elo_tea_id}}'>{{ e.tea_name }}</a></td>
    <td>{{ e.elo_points }}</td>
    <td><a href="/elo/edit/{{e.elo_tea_id}}">edit</a></td>
</tr>
{% endfor %}
</table>

{% endblock %}

