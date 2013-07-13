{% extends "index.tpl" %}

{% block body %}
<table class="table table-striped table-bordered table-hover table-condensed">
<tr>
    <th>cpt_id</th>
    <th>cpt_name</th>
    <th>ass_name</th>
    <th>cpt_elo_level</th>
</tr>
{% for cpt in competition %}
<tr>
    <td><a href='/competition/view/{{cpt.cpt_id}}'>{{ cpt.cpt_id }}</a></td>
    <td><a href='/competition/view/{{cpt.cpt_id}}'>{{ cpt.cpt_name }}</a></td>
    <td><a href='/association/view/{{cpt.cpt_ass_id}}'>{{ cpt.ass_name }}</a></td>
    <td><a href='/elo'>{{ cpt.cpt_elo_level }}</a></td>
</tr>
{% endfor %}
</table>
{% endblock %}

