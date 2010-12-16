function oc(a)
{
  var o = {};
  for(var i=0;i<a.length;i++)
  {
    o[a[i]]='';
  }
  return o;
}

function fire_select_with_options(elem)
{
    if(!elem){
        elem = this;
    }
    var target = eval($(this).attr('data-options-selector'));
    if($(target).attr('data-options-visible'))
    {
        if($(this).val() in oc($(target).attr('data-options-visible').split(';'))){
            $(target).fadeIn();
        }else{
            $(target).fadeOut();
        }
    }
}
function attach_select_with_options()
{
    $('.select_with_options').live('change', fire_select_with_options);
}

$(document).ready(function(){
    attach_select_with_options();
    $('.select_with_options').each(fire_select_with_options);
    $('.add_nested_item').click(function(){
        $('.select_with_options').each(fire_select_with_options);
        return true;
    });
});