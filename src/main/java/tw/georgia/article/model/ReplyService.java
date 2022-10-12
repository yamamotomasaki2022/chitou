package tw.georgia.article.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class ReplyService {

	@Autowired
	private ReplyRepository replyRepository;
	
//	****************新增************************
	public Reply insert(Reply reply) {
		return replyRepository.save(reply);
	}
}
