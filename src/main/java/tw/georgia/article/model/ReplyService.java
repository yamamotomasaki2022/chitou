package tw.georgia.article.model;

import java.util.List;
import java.util.Optional;

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
	
//	***********修改***********************************
	public Reply update(Reply Reply) {
		return replyRepository.save(Reply);
	}
	
//	****************查詢************************
	public List<Reply> findByReplyer(int replyer) {
		return replyRepository.findByReplyer(replyer);
	}	
	
//	****************查詢************************
	public Reply findByID(int replyID) {
		Optional<Reply> optional=replyRepository.findById(replyID);
		if (optional.isPresent()) {
			return optional.get();
		}
		return null;
	}
		
	
//	*************查詢全部*****************************
	public List<Reply> findAll() {
		return replyRepository.findAll();
	}
	
}
