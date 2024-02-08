package sangchu.images.dao;

import org.apache.ibatis.session.SqlSession;

import mybatis.config.MybatisUtil;
import sangchu.images.vo.ImagesVO;

public class ImagesDaoImpl implements IImagesDao{
	
	private static ImagesDaoImpl dao;
	private ImagesDaoImpl () {}
	public static ImagesDaoImpl getInstance() {
		if(dao==null)dao=new ImagesDaoImpl();
		return dao;
	}
	
	
	@Override
	public int uploadUserImage(ImagesVO imagesVO) {
		SqlSession session = MybatisUtil.getSqlSession();
		int res= 0;
		
		try {
			session.insert("member.uploadUserImage", imagesVO);
			session.commit();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null)session.close();
		}
		return res;
	}
	
}
