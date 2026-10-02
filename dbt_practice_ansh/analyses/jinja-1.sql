{% set fruits= [ 'apple', 'banana','strawberry','orange'] %}

{% for i in fruits %}
   
   {% if i!='orange'%}
        {{i}}
    {% else %}
        I hate {{i}}

    {% endif%}

{% endfor%}