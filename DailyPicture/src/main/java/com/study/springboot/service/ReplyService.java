package com.study.springboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.springboot.dao.IReplyDao;
import com.study.springboot.dto.ReplyDto;

 @Service("com.study.springboot.service.ReplySerivce")
public class ReplyService  implements IReplyService{
     
	
	
	@Autowired
	IReplyDao rdao;

	@Override
	public int replyInsert(ReplyDto rep) throws Exception {
	    return rdao.replyInsert(rep);
			
    }

	@Override
	public List<ReplyDto> replyList(int myct_no, int board_no) throws Exception {
		return rdao.replyList(myct_no, board_no);
	}



	@Override
	public int replyset(String id, String picture) {
		return rdao.replyset(id, picture);
	}



	@Override
	public int deleteRList(int board_no) throws Exception {
		return rdao.deleteRList(board_no);
	}



	@Override
	public int deleteReply(int reply_no) throws Exception {
		int Result  =  rdao.deleteReply(reply_no);
		
		return Result;
	}


	@Override
	public int replyUpdate(int reply_no, String content) throws Exception {
		return rdao.replyUpdate(reply_no, content);
	}


	@Override
	public int SingoreplyInsert(ReplyDto rep) throws Exception {
		int nResult = rdao.SingoreplyInsert(rep);
		return nResult;
	}



	@Override
	public List<ReplyDto> SingoreplyList(int myct_no) throws Exception {
		return rdao.SingoreplyList(myct_no);
	}



	@Override
	public int Singodelete(String id) throws Exception {
		return rdao.Singodelete(id);
	}



	@Override
	public int SingodeleteReply(int board_no, String id, String content) throws Exception {
		int nResult = rdao.SingodeleteReply(board_no, id, content);
		return nResult;
	}



}
