{% extends "index.tpl" %}

{% block body %}
<form action="/elo/edit/{{id}}" method=post>
<table class="table table-striped table-bordered table-hover table-condensed">
<tr>
    <th>tea_name</th>
    <th>elo_points</th>
    <th>action</th>
</tr>
{% for e in elo %}
<tr>
    <td>{{ e.tea_name }}</td>
    <td><input type=text name="elo_points" value="{{ e.elo_points }}"></td>
    <td><input type=submit value="submit"</td>
</tr>
{% endfor %}
</table>
</form>
{% endblock %}

