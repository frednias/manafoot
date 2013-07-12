<!DOCTYPE html>
<html>
  <head>
    <title>Manafoot Editor</title>
    <link rel="icon" type="image/x-icon" href="/favicon.ico" />
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link href="http://manafoot.com/bundles/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
      </head>
  <body>

<a href='/country/list'>Country</a>
<a href='/association/list'>Association</a>

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

Master association :
<table class="table table-striped table-bordered table-hover table-condensed">
<tr>
    <th>ass_id</th>
    <th>ass_name</th>
</tr>
{% for ass in master %}
    <tr>
        <td><a href='/association/view/{{ass.ass_id}}'>{{ ass.ass_id }}</a></td>
        <td><a href='/association/view/{{ass.ass_id}}'>{{ ass.ass_name }}</a></td>
    </tr>
{% endfor %}
</table>

Slave association :
<table class="table table-striped table-bordered table-hover table-condensed">
<tr>
    <th>ass_id</th>
    <th>ass_name</th>
</tr>
{% for ass in slave %}
    <tr>
        <td><a href='/association/view/{{ass.ass_id}}'>{{ ass.ass_id }}</a></td>
        <td><a href='/association/view/{{ass.ass_id}}'>{{ ass.ass_name }}</a></td>
    </tr>
{% endfor %}
</table>

Have competitions :
<table class="table table-striped table-bordered table-hover table-condensed">
<tr>
    <th>cpt_id</th>
    <th>cpt_name</th>
</tr>
{% for cpt in competition %}
    <tr>
        <td><a href='/competition/view/{{cpt.cpt_id}}'>{{ cpt.cpt_id }}</a></td>
        <td><a href='/competition/view/{{cpt.cpt_id}}'>{{ cpt.cpt_name }}</a></td>
    </tr>
{% endfor %}
</table>

Have teams :
<table class="table table-striped table-bordered table-hover table-condensed">
<tr>
    <th>tea_id</th>
    <th>tea_name</th>
</tr>
{% for tea in team %}
    <tr>
        <td><a href='/team/view/{{tea.tea_id}}'>{{ tea.tea_id }}</a></td>
        <td><a href='/team/view/{{tea.tea_id}}'>{{ tea.tea_name }}</a></td>
    </tr>
{% endfor %}
</table>


<script src="http://code.jquery.com/jquery.js"></script>
<script src="http://manafoot.com/bundles/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>

