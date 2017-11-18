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
	    text: '学生成绩管理',
	    iconCls: 'icon-student',
	    url: 'student_grade.aspx',
	}]
});
$('#myTree1').tree({
    onClick: function (node) {
        openPage(node);
    },

    data: [{
        text: '修改资料',
        iconCls: 'icon-edit',
        url: 'edit_info.aspx',
    }
    ]
});
$('#myTree2').tree({
    onClick: function (node) {
        openPage(node);
    },

    data: [{
        text: '上传成绩',
        iconCls: 'icon-edit',
        url: 'grade_reload.aspx',
    }
   ]
});
