package TeamRepository;


import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.crm.viewBean.LoginBean;

@Repository
public interface LoginRepository extends CrudRepository<LoginBean, Long> {

	int isValidUser(String username, String password);
}
