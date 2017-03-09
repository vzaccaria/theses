{% for t in topics %}

# {{ t.name }} 

**Type**: *{{t.type}}* c.o. {{t.address}}

**Description**:

{{t.description}}

**Skills**: {% for s in t.skills %}{{s}} --- {% endfor %}

**Contacts**:

{% for c in t.contacts %} - {{c.name}}: <{{c.email}}>
{% endfor %}

---

{% endfor %}
  
