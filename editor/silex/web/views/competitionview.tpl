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

{% if nb_chi > 0 %}

select team

{% else %}

<!-- Button to trigger modal -->
<a href="#myModal2" role="button" class="btn" data-toggle="modal">Set as National Championship</a>
<!-- Modal -->
<form class="form-horizontal" action='/championship/create/{{cpt_id}}' method='post'>
<div id="myModal2" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
    <h3 id="myModalLabel">Set as National Championship</h3>
  </div>
  <div class="modal-body">

  <div class="control-group">
    <label class="control-label" for="chi_level">chi_level</label>
    <div class="controls">
      <input type="text" id="chi_level" placeholder="chi_level" name="chi_level">
    </div>
  </div>
  <div class="control-group">
    <label class="control-label" for="chi_nb_team">chi_nb_team</label>
    <div class="controls">
      <input type="text" id="chi_nb_team" placeholder="chi_nb_team" name="chi_nb_team">
    </div>
  </div>
  <div class="control-group">
    <label class="control-label" for="chi_nb_group">chi_nb_group</label>
    <div class="controls">
      <input type="text" id="chi_nb_group" placeholder="chi_nb_group" name="chi_nb_group">
    </div>
  </div>
  <div class="control-group">
    <label class="control-label" for="chi_nb_promote">chi_nb_promote</label>
    <div class="controls">
      <input type="text" id="chi_nb_promote" placeholder="chi_nb_promote" name="chi_nb_promote">
    </div>
  </div>
  <div class="control-group">
    <label class="control-label" for="chi_nb_relegate">chi_nb_relegate</label>
    <div class="controls">
      <input type="text" id="chi_nb_relegate" placeholder="chi_nb_relegate" name="chi_nb_relegate">
    </div>
  </div>

  </div>
  <div class="modal-footer">
    <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
    <button class="btn btn-primary">Save changes</button>
  </div>
</div>
</form>
{% endif %}

{% endblock %}

