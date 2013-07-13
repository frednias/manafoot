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

<!-- Button to trigger modal -->
<a href="#myModal" role="button" class="btn" data-toggle="modal">Create new competition</a>
 
<!-- Modal -->
<form class="form-horizontal" action='/competition/create' method='post'>
<div id="myModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
    <h3 id="myModalLabel">Create new Competition</h3>
  </div>
  <div class="modal-body">

  <div class="control-group">
    <label class="control-label" for="inputEmail">cpt_name</label>
    <div class="controls">
      <input type="text" id="cpt_id" placeholder="cpt_name" name="cpt_name">
    </div>
  </div>
  <div class="control-group">
    <label class="control-label" for="inputPassword">ass_name</label>
    <div class="controls">
      <input type="text" id="typeahead" placeholder="ass_name" name="ass_name">
    </div>
  </div>
  <div class="control-group">
    <label class="control-label" for="inputPassword">cpt_elo_points</label>
    <div class="controls">
      <input type="text" id="cpt_elo_level" placeholder="cpt_elo_level" name="cpt_elo_level">
    </div>
  </div>

  </div>
  <div class="modal-footer">
    <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
    <button class="btn btn-primary">Save changes</button>
  </div>
</div>
</form>

<script>
$(function(){
    $('#typeahead').typeahead({
        source: function (query, process) {
            return $.getJSON(
                '/association/lookup/'+query,
                { query: query },
                function (data) {
                   var newData = [];
                    $.each(data, function(){
                        newData.push('['+this.ass_id+']' + ' ' + this.ass_name);
                    });
                    return process(newData);
                });
        }
    });         
});

</script>

{% endblock %}

