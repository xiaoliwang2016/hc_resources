(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["chunk-61e3503d"],{2720:function(e,t,n){},"5da0":function(e,t,n){"use strict";n.r(t);var c=function(){var e=this,t=e.$createElement,n=e._self._c||t;return n("div",{staticClass:"container"},[n("div",{staticClass:"head"},[e._v("当前管理员："+e._s(e.user_name))]),e._v(" "),n("div",{staticClass:"body clearfix"},[n("div",{staticClass:"l"},[n("el-tag",{staticStyle:{margin:"15px"}},[e._v("角色")]),e._v(" "),n("el-checkbox-group",{model:{value:e.checkRoles,callback:function(t){e.checkRoles=t},expression:"checkRoles"}},e._l(e.roles,function(t){return n("el-checkbox",{key:t.id,attrs:{label:t.id},on:{change:function(n){return e.roleChangeHandler(n,t.id)}}},[e._v(e._s(t.role_name))])}),1)],1),e._v(" "),n("div",{staticClass:"r"},[n("el-tag",{staticStyle:{margin:"15px"},attrs:{type:"success"}},[e._v("权限")]),e._v(" "),n("el-checkbox-group",{model:{value:e.checkAccesses,callback:function(t){e.checkAccesses=t},expression:"checkAccesses"}},e._l(e.options,function(t){return n("el-checkbox",{key:t.id,attrs:{label:t.id}},[e._v(e._s(t.remark))])}),1)],1)]),e._v(" "),n("div",{staticClass:"btn-group"},[n("el-button",{attrs:{type:"info",size:"small"}},[e._v("清空")]),e._v(" "),n("el-button",{attrs:{type:"success",size:"small"},on:{click:e.save}},[e._v("保存")])],1)])},s=[],i=n("75fc"),a=(n("7f7f"),n("50fc")),r=n("cc5e"),o={name:"AdminAuth",data:function(){return{user_name:"",checkAll:!1,options:[],roles:[],checkRoles:[],checkAccesses:[]}},mounted:function(){var e=this;this.user_name=this.$route.query.name,a["d"]().then(function(t){e.options=t.data,a["d"]({admin_id:e.$route.query.id,theme_id:e.$store.state.admin.themeInfo.id}).then(function(t){e.checkAccesses=t.data.reduce(function(e,t){return[].concat(Object(i["a"])(e),[t.id])},[])})}),Object(r["d"])({theme_id:this.$store.state.admin.themeInfo.id,role_group:1}).then(function(t){e.roles=t.data})},methods:{roleChangeHandler:function(e,t){var n=this;a["d"]({role_id:t}).then(function(t){var c=Object(i["a"])(n.checkAccesses);t.data.map(function(t){e?-1==c.indexOf(t.id)&&c.push(t.id):-1!=c.indexOf(t.id)&&c.splice(c.indexOf(t.id),1)}),n.checkAccesses=c})},save:function(){var e=this;this.loading=this.$loading(),a["b"]({admin_id:this.$route.query.id,theme_id:this.$store.state.admin.themeInfo.id,access_id:this.checkAccesses}).then(function(t){e.loading.close(),e.$router.go(-1)})}}},u=o,d=(n("cc8b"),n("2877")),l=Object(d["a"])(u,c,s,!1,null,"33c5bb05",null);t["default"]=l.exports},cc5e:function(e,t,n){"use strict";n.d(t,"d",function(){return s}),n.d(t,"a",function(){return i}),n.d(t,"c",function(){return a}),n.d(t,"b",function(){return r}),n.d(t,"e",function(){return o});var c=n("b775");function s(e){return Object(c["a"])({url:"/admin/role/list",method:"get",params:e})}function i(e){return Object(c["a"])({url:"/admin/role/addOrUpdate",method:"post",data:e})}function a(e){return Object(c["a"])({url:"/admin/role/listResources",method:"get",params:e})}function r(e){return Object(c["a"])({url:"/admin/role/assignToUser",method:"post",data:e})}function o(){return Object(c["a"])({url:"/admin/role/listUser",method:"get",params:params})}},cc8b:function(e,t,n){"use strict";var c=n("2720"),s=n.n(c);s.a}}]);