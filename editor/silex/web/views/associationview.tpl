{% extends "index.tpl" %}

{%block body %}
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
<!-- Button to trigger modal -->
<a href="#myModal" role="button" class="btn" data-toggle="modal">Create new slave association</a>
 
<!-- Modal -->
<form class="form-horizontal" action='/association/create/slave/{{ass_id}}' method='post'>
<div id="myModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
    <h3 id="myModalLabel">Create new slave association</h3>
  </div>
  <div class="modal-body">

  <div class="control-group">
    <label class="control-label" for="inputEmail">ass_name</label>
    <div class="controls">
      <input type="text" id="cpt_id" placeholder="ass_name" name="ass_name">
    </div>
  </div>

  </div>
  <div class="modal-footer">
    <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
    <button class="btn btn-primary">Save changes</button>
  </div>
</div>
</form>

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


<!-- Button to trigger modal -->
<a href="#myModal2" role="button" class="btn" data-toggle="modal">Create new team</a>
<!-- Modal -->
<form class="form-horizontal" action='/team/create/{{ass_id}}' method='post'>
<div id="myModal2" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
    <h3 id="myModalLabel">Create new team</h3>
  </div>
  <div class="modal-body">

  <div class="control-group">
    <label class="control-label" for="inputEmail">tea_name</label>
    <div class="controls">
      <input type="text" id="tea_id" placeholder="tea_name" name="tea_name">
    </div>
  </div>
  <div class="control-group">
    <label class="control-label" for="tea_gender">tea_gender</label>
    <div class="controls">
      <input type="text" id="tea_gender" placeholder="tea_gender" name="tea_gender"i value='M'>
    </div>
  </div>

  </div>
  <div class="modal-footer">
    <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
    <button class="btn btn-primary">Save changes</button>
  </div>
</div>
</form>
{% endblock %}

