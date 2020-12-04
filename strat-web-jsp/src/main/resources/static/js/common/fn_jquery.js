jQuery.prototype.serializeJsonObject=function(){
    var o = {};
    var json = [];
    var a = this.serializeArray();
    $.each(a, function () {
        if(o[this.name]) {
            if(!o[this.name].push) {
                o[this.name] = o[this.name];
                console.log($.toJSON(o));
                json.push(o);
            }
            o[this.name] = this.value || '';
            //o[this.name].push(this.value || '');
            console.log($.toJSON(o));
            json.push(o);
        }else {
            o[this.name] = this.value || '';
        }
    });
    return $.toJSON(json);
};
jQuery.prototype.serializeJsonObject1=function() {
    var o = {};
    var a = this.serializeArray();
    $.each(a, function () {
        if (o[this.name]) {
            if (!o[this.name].push) {
                o[this.name] = [o[this.name]];
            }
            o[this.name].push(this.value || '');
        } else {
            o[this.name] = this.value || '';
        }
    });
    return o;
};
