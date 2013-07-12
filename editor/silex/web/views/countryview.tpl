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
<script src="http://code.jquery.com/jquery.js"></script>
<script src="http://manafoot.com/bundles/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>

