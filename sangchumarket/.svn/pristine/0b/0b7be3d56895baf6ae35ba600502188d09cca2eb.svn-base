package sangchu.images.service;

import sangchu.images.dao.ImagesDaoImpl;
import sangchu.images.vo.ImagesVO;

public class ImagesServiceImpl implements IImagesService{
	
	private static ImagesServiceImpl service;
	private ImagesDaoImpl dao;
	private ImagesServiceImpl () {
		dao = ImagesDaoImpl.getInstance();
	}
	public static ImagesServiceImpl getInstance() {
		if(service==null)service = new ImagesServiceImpl();
		return service;
	}
	
	
	@Override
	public int uploadUserImage(ImagesVO imagesVO) {
		return dao.uploadUserImage(imagesVO);
	}

}
