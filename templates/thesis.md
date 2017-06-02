# Proposte di tesi in ambito architetture dei calcolatori
{% for t in topics %}

## {{ t.name }} // {{ t.institution }}

**Type**: *{{t.type}}* c.o. {{t.institution}} - {{t.address}}

**Description**: 

{{t.description}}

**Skills**: {% for s in t.skills %}{{s}} --- {% endfor %}

**Contacts**: {% for c in t.contacts %}{{c.name}} <<{{c.address}}>>{% if forloop.last == false %}, {%endif%}{% endfor %} --- **Academic contact**: Vittorio Zaccaria <<vittorio.zaccaria@polimi.it>>

{% endfor %}
  
