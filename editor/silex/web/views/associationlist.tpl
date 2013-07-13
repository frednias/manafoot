{% extends "index.tpl" %}

{% block body %}
<table class="table table-striped table-bordered table-hover table-condensed">
<tr>
    <th>ass_id</th>
    <th>ass_name</th>
    <th>cou_name</th>
</tr>
{% for ass in association %}
    <tr>
        <td><a href='/association/view/{{ass.ass_id}}'>{{ ass.ass_id }}</a></td>
        <td><a href='/association/view/{{ass.ass_id}}'>{{ ass.ass_name }}</a></td>
        <td><a href='/country/view/{{ass.ass_cou_id}}'>{{ ass.cou_name }}</a></td>
    </tr>
{% endfor %}
</table>
{% endblock %}

