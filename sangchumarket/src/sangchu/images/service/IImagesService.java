package sangchu.images.service;

import sangchu.images.vo.ImagesVO;

public interface IImagesService {
	/**
	 * 회원가입시 사용자 이미지 업로드
	 * @param imagesVO
	 * @return 성공1, 실패0
	 */
	public int uploadUserImage (ImagesVO imagesVO);
}
