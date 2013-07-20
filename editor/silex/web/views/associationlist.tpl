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
<div class="pagination pagination-left">
<ul>
{% set npage = count // 20 %}
{% if count % 20 > 0 %}
{% set npage = npage + 1 %}
{% endif %}
{% for i in range(1,npage) %}
    {% if page == i %}
        <li class="active"><a href='#'>{{i}}</a></li>
    {% else %}
        <li><a href='/association/list/{{i}}'>{{i}}</a></li>
    {% endif %}
{% endfor %}
</ul>
</div>

<!-- Button to trigger modal -->
<a href="#myModal" role="button" class="btn" data-toggle="modal">Create new association</a>
 
<!-- Modal -->
<form class="form-horizontal" action='/association/create' method='post'>
<div id="myModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
    <h3 id="myModalLabel">Create new association</h3>
  </div>
  <div class="modal-body">

  <div class="control-group">
    <label class="control-label" for="inputPassword">ass_cou_id</label>
    <div class="controls">
      <input type="text" id="typeahead" placeholder="ass_cou_id" name="ass_cou_id">
    </div>
  </div>
  <div class="control-group">
    <label class="control-label" for="inputEmail">as_name</label>
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

<script>
$(function(){
    $('#typeahead').typeahead({
        source: function (query, process) {
            return $.getJSON(
                '/country/lookup/'+query,
                { query: query },
                function (data) {
                   var newData = [];
                    $.each(data, function(){
                        newData.push('['+this.cou_id+']' + ' ' + this.cou_name);
                    });
                    return process(newData);
                });
        }
    });         
});

</script>

{% endblock %}

