function openPage(node){
    
    if ($('#mytabs').tabs('exists', node.text)) {
        $('#mytabs').tabs('select',node.text);
       
    }else{
        $('#mytabs').tabs('add',{
            title:node.text,
            href: node.url,
            closable: true,
        });
    }
}
$('#myTree').tree({
    onClick: function(node){
        openPage(node);
    },

	data: [{
	    text: '管理员信息管理',
	    iconCls: 'icon-admin',
		url:'admin.aspx',
	},{
	    text: '教师信息管理',
	    iconCls: 'icon-teacher',
	    url: 'teacher.aspx',
	}, {
	    text: '学生信息管理',
	    iconCls: 'icon-student',
	    url: 'student.aspx',
	}]
});
$('#myTree1').tree({
    onClick: function (node) {
        openPage(node);
    },

    data: [{
        text: '审核成绩',
        iconCls: 'icon-review',
        url: ''
    }
 ]
});
