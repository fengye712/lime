<?php
// +----------------------------------------------------------------------
// | MobileCms 移动应用软件后台管理系统
// +----------------------------------------------------------------------
// | provide by ：phonegap100.com
//
// +----------------------------------------------------------------------
// | Author: htzhanglong@foxmail.com
// +----------------------------------------------------------------------

class QuestionAction extends BaseAction
{
	public function index()
	{
		$question_mod = D('question');
		$question_cate_mod = D('question_cate');
		//搜索
		$where = 'status=1';
		// if (isset($_GET['keyword']) && trim($_GET['keyword'])) {
		//     $where .= " AND title LIKE '%".$_GET['keyword']."%'";
		//     $this->assign('keyword', $_GET['keyword']);
		// }
		// if (isset($_GET['time_start']) && trim($_GET['time_start'])) {
		//     $time_start = $_GET['time_start'];
		//     $where .= " AND add_time>='".$time_start."'";
		//     $this->assign('time_start', $_GET['time_start']);
		// }
		// if (isset($_GET['time_end']) && trim($_GET['time_end'])) {
		//     $time_end = $_GET['time_end'];
		//     $where .= " AND add_time<='".$time_end."'";
		//     $this->assign('time_end', $_GET['time_end']);
		// }
		// if (isset($_GET['cate_id']) && intval($_GET['cate_id'])) {
		//     $where .= " AND cate_id=".$_GET['cate_id'];
		//     $this->assign('cate_id', $_GET['cate_id']);
		// }
		import("ORG.Util.Page");
		$big_menu = array('javascript:window.top.art.dialog({id:\'add\',iframe:\'?m=Question&a=add\', title:\'添加题目\', width:\'500\', height:\'490\', lock:true}, function(){var d = window.top.art.dialog({id:\'add\'}).data.iframe;var form = d.document.getElementById(\'dosubmit\');form.click();return false;}, function(){window.top.art.dialog({id:\'add\'}).close()});void(0);', '添加题目');
		$count = $question_mod->where($where)->count();
		$p = new Page($count,20);
		$question_list = $question_mod->where($where)->limit($p->firstRow.','.$p->listRows)->order('add_time DESC')->select();
		$key = 1;
		foreach($question_list as $k=>$val){
			$question_list[$k]['key'] = ++$p->firstRow;
			$question_list[$k]['cate_name'] = $question_cate_mod->field('name')->where('id='.$val['cate_id'])->find();
		}
		//网站信息/应用资讯
		$page = $p->show();
		$this->assign('page',$page);
    	// $this->assign('cate_list', $cate_list);
		$this->assign('big_menu',$big_menu);
		$this->assign('question_list',$question_list);
		$this->display();
	}

	function edit()
	{
		if(isset($_POST['dosubmit'])){
			print_r($_POST);die;
//			$article_mod = D('article');
//			$data = $article_mod->create();
//			if($data['cate_id']==0){
//				$this->error('请选择资讯分类');
//			}
//			if ($_FILES['img']['name']!='') {
//			    $upload_list = $this->_upload();
//			    $data['img'] = $upload_list['0']['savename'];
//			}
//			$result = $article_mod->save($data);
//			if(false !== $result){
//				$this->success(L('operation_success'),U('Article/index'));
//			}else{
//				$this->error(L('operation_failure'));
//			}
		}else{


			if( isset($_GET['id']) ){
				$q_id = isset($_GET['id']) && intval($_GET['id']) ? intval($_GET['id']) : $this->error(L('please_select'));
			}
			$question_mod = D('question');
			$question_cate_mod = D('question_cate');
			$question_answer_mod = D('question_answer');
			$question_info = $question_mod->where('id='.$q_id)->find();
		    $answer_list = $question_answer_mod->where('q_id='.$q_id)->select();
			$result = $question_cate_mod->select();
			$cate_list = array();
			foreach ($result as $val) {
				if($val['id'] == $question_info['cate_id'])
				{
					$cate_list['parent'][$val['id']] = $val;
				}else{
					$cate_list['parent'][$val['id']] = $val;
				}
			}
	    	$this->assign('cate_list',$cate_list);
			$this->assign('answer_list',$answer_list);
			$this->assign('question_info',$question_info);
			$this->display();
		}


	}

	function add()
	{
		if(isset($_POST['dosubmit'])){
			$question_mod =M('question');
			// print_r($_POST);
			if($_POST['qname']==''){
				$this->error(L('input').L('article_title'));
			}

			if(false === $data = $question_mod->create()){
				$this->error($question_mod->error());
			}
			$question_mod->add_time=date('Y-m-d H:i:s',time());
			$question_mod->ans_id=rand(1,100);
			$result = $question_mod->add();
			if($result){
				$question_ans_mod =M('question_answer');
				$q_id=$question_mod->getLastInsID();
				foreach ($_POST['option'] as $v){
					$question_ans_mod->ans_name=$v;
					$question_ans_mod->q_id=$q_id;
					$question_ans_mod->add();

				}
				$this->success('添加成功');
			}else{
				$this->error('添加失败');
			}
		}else{
			$question_cate_mod = D('question_cate');
	    	$result = $question_cate_mod->select();
	    	$cate_list = array();
	    	foreach ($result as $val) {
	    	    if ($val['pid']==0) {
	    	        $cate_list['parent'][$val['id']] = $val;
	    	    } else {
	    	        $cate_list['sub'][$val['pid']][] = $val;
	    	    }
	    	}
				// print_r($cate_list);die;
	    	$this->assign('cate_list',$cate_list);
	    	$this->display();
		}
	}
	function delete()
    {
		$article_mod = D('article');
		if((!isset($_GET['id']) || empty($_GET['id'])) && (!isset($_POST['id']) || empty($_POST['id']))) {
            $this->error('请选择要删除的资讯！');
		}
		if( isset($_POST['id'])&&is_array($_POST['id']) ){
			$cate_ids = implode(',',$_POST['id']);
			foreach( $_POST['id'] as $val ){
				$article = $article_mod->field("id,cate_id")->where("id=".$val)->find();
				$cate = M('article_cate')->field('id,pid')->where("id=".$article['cate_id'])->find();
				if( $cate['pid']!=0 ){
					M('article_cate')->where("id=".$cate['pid'])->setDec('article_nums');
					M('article_cate')->where("id=".$article['cate_id'])->setDec('article_nums');
				}else{
					M('article_cate')->where("id=".$article['cate_id'])->setDec('article_nums');
				}

			}
			$article_mod->delete($cate_ids);
		}else{
			$cate_id = intval($_GET['id']);
			$article = $article_mod->field("id,cate_id")->where("id=".$cate_id)->find();
			M('article_cate')->where("id=".$article['cate_id'])->setDec('article_nums');
		    $article_mod->where('id='.$cate_id)->delete();
		}
		$this->success(L('operation_success'));
    }

    public function _upload()
    {
    	import("ORG.Net.UploadFile");
        $upload = new UploadFile();
        //设置上传文件大小
        $upload->maxSize = 3292200;
        //$upload->allowExts = explode(',', 'jpg,gif,png,jpeg');
        $upload->savePath = './data/news/';

        $upload->saveRule = uniqid;
        if (!$upload->upload()) {
            //捕获上传异常
            $this->error($upload->getErrorMsg());
        } else {
            //取得成功上传的文件信息
            $uploadList = $upload->getUploadFileInfo();
        }
        return $uploadList;
    }

	function sort_order()
    {
    	$article_mod = D('article');
		if (isset($_POST['listorders'])) {
            foreach ($_POST['listorders'] as $id=>$sort_order) {
            	$data['ordid'] = $sort_order;
                $article_mod->where('id='.$id)->save($data);
            }
            $this->success(L('operation_success'));
        }
        $this->error(L('operation_failure'));
    }

    //修改状态
	function status()
	{
		$article_mod = D('article');
		$id 	= intval($_REQUEST['id']);
		$type 	= trim($_REQUEST['type']);
		$sql 	= "update ".C('DB_PREFIX')."article set $type=($type+1)%2 where id='$id'";
		$res 	= $article_mod->execute($sql);
		$values = $article_mod->field("id,".$type)->where('id='.$id)->find();
		$this->ajaxReturn($values[$type]);
	}

}
?>
