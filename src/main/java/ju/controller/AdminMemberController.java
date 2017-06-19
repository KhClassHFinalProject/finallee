package ju.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import ju.dto.*;
import ju.model.*;

import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.http.HttpSession;

@Controller
public class AdminMemberController {

	@Autowired
	public MemberDAO memberDao;

	@Autowired
	public LoanDAO loanDao;	
	
	
	// 회원관리 페이지로 이동
	@RequestMapping("/memberList.ju")
	public ModelAndView memberList(
			@RequestParam(value="cp",defaultValue="1")int cp){
		int totalCnt = memberDao.getTotalCnt();// 페이징을 위해
		totalCnt = totalCnt==0?1:totalCnt; // 0이면 1을 반환해주도록 검증
		int listSize = 10;
		int pageSize = 5;
		
		
	    int totalPage = totalCnt/listSize;
	    if(totalCnt % listSize > 0){
	       totalPage++;
	    }
	    
	    if(cp>totalPage && totalPage!=0){
	       cp = totalPage;
	    }else if(cp < 1){
	       cp = 1;
	    }
	      
	    int startPage = ((cp-1)/listSize)*listSize+1;
	    int endPage = startPage + pageSize -1;
	    if(endPage > totalPage){
	       endPage = totalPage;
	    }
	    
		
		String pageStr = ju.page.PageModule.pageMake("memberList.ju", totalCnt, listSize, pageSize, cp); // 페이징을 위해 저장
		List<MemberDTO> list = memberDao.memberList(cp, listSize);
		for(int i=0; i<list.size(); i++){
			String birth = list.get(i).getMem_birth().split("~")[0];
			list.get(i).setMem_birth(birth);
		}
		ModelAndView mav = new ModelAndView("admin/memberManage/memberList","list",list);
		mav.addObject("pageStr",pageStr);
		return mav;
	}
	
	// 정지회원관리 페이지로 이동
		@RequestMapping("/memberBanList.ju")
		public ModelAndView memberBanList(
				@RequestParam(value="cp",defaultValue="1")int cp){
			int totalCnt = memberDao.getTotalCntBan();// 페이징을 위해
			totalCnt = totalCnt==0?1:totalCnt; // 0이면 1을 반환해주도록 검증
			int listSize = 10;
			int pageSize = 5;
			String pageStr = ju.page.PageModule.pageMake("memberBanList.ju", totalCnt, listSize, pageSize, cp); // 페이징을 위해 저장
			List<BanDTO> list = memberDao.memberBanList(cp, listSize);
			String dateFormat="yyyy-MM-dd";
			SimpleDateFormat sdf=new SimpleDateFormat(dateFormat);
			for(int i=0; i<list.size(); i++){
				String sdDay = sdf.format(list.get(i).getBan_start());
				list.get(i).setBan_sday(sdDay);
				String edDay = sdf.format(list.get(i).getBan_end());
				list.get(i).setBan_eday(edDay);
				int info = list.get(i).getBan_reason();
				switch(info){
				case 0: list.get(i).setBan_str("기물 파손"); break;
				case 1: list.get(i).setBan_str("분실"); break;
				case 2: list.get(i).setBan_str("지속적인 연체"); break;
				case 3: list.get(i).setBan_str("도서관 풍기문란"); break;
				case 4: list.get(i).setBan_str("허위사실 유포");
				case 5: list.get(i).setBan_str("열람실 내 취식");
				case 6: list.get(i).setBan_str("모태솔로");
				}
				int banday = list.get(i).getBan_day();
				if(banday>0){
					list.get(i).setBan_state("정지");
				}else{
					list.get(i).setBan_state("해제");
				}
			}
			
			ModelAndView mav = new ModelAndView("admin/memberManage/memberBanList","list",list);
			mav.addObject("pageStr",pageStr);
			return mav;
		}
	
	// 회원명 검색했을때의 결과 및 페이징
	@RequestMapping(value="/memberSearchList.ju",method=RequestMethod.GET)
	public ModelAndView memberListSearch(
			@RequestParam(value="cp",defaultValue="1")int cp,
			@RequestParam(value="mem_name",defaultValue="0")String mem_name){
		System.out.println("검색컨트롤러입성");
		int totalCnt = memberDao.getTotalCntSearch(mem_name);// 페이징을 위해
		totalCnt = totalCnt==0?1:totalCnt; // 0이면 1을 반환해주도록 검증
		int listSize = 10;
		int pageSize = 5;
		String pageStr = ju.page.PageModule.pageMakeMemSearch("memberSearchList.ju",mem_name, totalCnt, listSize, pageSize, cp); // 페이징을 위해 저장
		List<MemberDTO> list = memberDao.memberListSearch(cp, listSize,mem_name);
		for(int i=0; i<list.size(); i++){
			String birth = list.get(i).getMem_birth().split("~")[0];
			list.get(i).setMem_birth(birth);
		}
		ModelAndView mav = new ModelAndView("admin/memberManage/memberList","list",list);
		mav.addObject("pageStr",pageStr);
		return mav;
	}
	
	// 정지 페이지에서 회원명 검색했을때의 결과 및 페이징
		@RequestMapping(value="/memberBanSearchList.ju",method=RequestMethod.GET)
		public ModelAndView memberBanListSearch(
				@RequestParam(value="cp",defaultValue="1")int cp,
				@RequestParam(value="mem_name",defaultValue="0")String mem_name){
			int totalCnt = memberDao.getTotalCntBanSearch(mem_name);// 페이징을 위해
			totalCnt = totalCnt==0?1:totalCnt; // 0이면 1을 반환해주도록 검증
			int listSize = 10;
			int pageSize = 5;
			String pageStr = ju.page.PageModule.pageMakeMemSearch("memberBanSearchList.ju",mem_name, totalCnt, listSize, pageSize, cp); // 페이징을 위해 저장
			List<BanDTO> list = memberDao.memberBanListSearch(cp, listSize,mem_name);
			
			String dateFormat="yyyy-MM-dd";
			SimpleDateFormat sdf=new SimpleDateFormat(dateFormat);
			for(int i=0; i<list.size(); i++){
				System.out.println("id="+list.get(i).getMem_id());
				String sdDay = sdf.format(list.get(i).getBan_start());
				list.get(i).setBan_sday(sdDay);
				String edDay = sdf.format(list.get(i).getBan_end());
				list.get(i).setBan_eday(edDay);
				int info = list.get(i).getBan_reason();
				switch(info){
				case 0: list.get(i).setBan_str("기물 파손"); break;
				case 1: list.get(i).setBan_str("분실"); break;
				case 2: list.get(i).setBan_str("지속적인 연체"); break;
				case 3: list.get(i).setBan_str("도서관 풍기문란"); break;
				case 4: list.get(i).setBan_str("허위사실 유포");
				case 5: list.get(i).setBan_str("열람실 내 취식");
				case 6: list.get(i).setBan_str("모태솔로");
				}
				int banday = list.get(i).getBan_day();
				if(banday>0){
					list.get(i).setBan_state("정지");
				}else{
					list.get(i).setBan_state("해제");
				}
			}
			System.out.println(list);
			ModelAndView mav = new ModelAndView("admin/memberManage/memberBanList","list",list);
			mav.addObject("pageStr",pageStr);
			return mav;
		}
	
	
	// 회원 정보페이지로 이동
	@RequestMapping(value="memberInfo.ju",method=RequestMethod.GET)
	public ModelAndView memberInfo(String mem_idx){
		MemberDTO dto = memberDao.memberInfo(mem_idx);
		int count = memberDao.banCount(mem_idx);
		List<LoanDTO> list = loanDao.loanList(mem_idx);
		String dateFormat="yyyy-MM-dd";
		SimpleDateFormat sdf=new SimpleDateFormat(dateFormat);
		for(int i=0; i<list.size(); i++){
			String sdDay = sdf.format(list.get(i).getLb_sd());
			list.get(i).setLb_sday(sdDay);
			String edDay = sdf.format(list.get(i).getLb_ed());
			list.get(i).setLb_eday(edDay);
			int ret = list.get(i).getLb_return();
			switch(ret){
			case 0: list.get(i).setLb_returnStr("반납됨"); break;
			case 1: list.get(i).setLb_returnStr("일반대출중"); break;
			case 2: list.get(i).setLb_returnStr("택배대출중");
			}
		}

		List<LoanDTO> list3 = loanDao.loanReList(mem_idx);
		String dateFormat2="yyyy-MM-dd";
		SimpleDateFormat sdf2=new SimpleDateFormat(dateFormat2);
		for(int i=0; i<list3.size(); i++){
			String sdDay2 = sdf2.format(list3.get(i).getLb_sd());
			list3.get(i).setLb_sday(sdDay2);
			String edDay2 = sdf2.format(list3.get(i).getLb_ed());
			list3.get(i).setLb_eday(edDay2);
			int ret2 = list3.get(i).getLb_return();
			switch(ret2){
			case 0: list3.get(i).setLb_returnStr("반납됨"); break;
			case 1: list3.get(i).setLb_returnStr("일반대출중"); break;
			case 2: list3.get(i).setLb_returnStr("택배대출중");
			}
		}
		BanDTO dto2 = memberDao.memberBanInfo(mem_idx);
		ModelAndView mav = new ModelAndView("admin/memberManage/memberInfo","dto",dto);
		mav.addObject("list",list);
		mav.addObject("list3",list3);
		mav.addObject("dto2",dto2);
		mav.addObject("count",count);
		mav.addObject("mem_idx", mem_idx);
		return mav;
	}
	
	// 회원 정지 시키기
	@RequestMapping(value="/banAdd.ju",method=RequestMethod.GET)
	public ModelAndView banAdd(
			@RequestParam(value="ban_period", defaultValue="0")int ban_period,
			BanDTO dto){
		System.out.println("컨트롤러");
		Long unixTime=System.currentTimeMillis();
		String ban_idx="BN"+unixTime;
		dto.setBan_idx(ban_idx);
		System.out.println(ban_period);
		int result = memberDao.banAdd(dto, ban_period);
		String msg = result>0?"정지 성공":"정지 실패";
		ModelAndView mav = new ModelAndView("admin/adminMsg","msg",msg);
		String mem_idx = dto.getMem_idx();
		mav.addObject("page","memberInfo.ju?mem_idx="+mem_idx);
		return mav;
	}
	
	// 회원 정지 풀기
	@RequestMapping(value="/banDel.ju",method=RequestMethod.GET)
	public ModelAndView banDel(String mem_idx){
		int result = memberDao.banDel(mem_idx);
		String msg = result>0?"정지해제 성공":"정지해제 실패";
		ModelAndView mav = new ModelAndView("admin/adminMsg","msg",msg);
		mav.addObject("page","memberList.ju");
		return mav;
	}
	
	// 회원 강제 탈퇴
	@RequestMapping(value="/memDel.ju",method=RequestMethod.GET)
	public ModelAndView memDel(String mem_idx){
		List<LoanDTO> list = memberDao.memberLoan(mem_idx);
		System.out.println(list.size());
		System.out.println(mem_idx);
		ModelAndView mav = null;
		if(list.size()==0){
			int result = memberDao.memberDel(mem_idx);
			String msg = result>0?"회원 강제탈퇴 성공":"회원 강제탈퇴 실패";
			mav = new ModelAndView("admin/adminMsg","msg",msg);
			mav.addObject("page","memberList.ju");
		}else{
			String msg = "책을 대여중인 회원입니다. 반납 후 탈퇴처리 하십시오.";
			mav = new ModelAndView("admin/adminMsg","msg",msg);
			mav.addObject("page","memberInfo.ju?mem_idx="+mem_idx);
		}
		
		return mav;
	}
	
	// 대출 시 회원정보 가져가는 코드
	@RequestMapping(value="memberInfo.ju",method=RequestMethod.POST)
	public ModelAndView memberInfo2(String mem_idx,HttpSession session){
		ModelAndView mav = null;
		BanDTO bandto = memberDao.memberLoanBan(mem_idx);
		MemberDTO dto = memberDao.memberInfo(mem_idx);
		if(dto==null){
			String msg = "올바른 회원 코드가 아닙니다. 다시 확인해 주세요";
			mav = new ModelAndView("admin/adminMsg","msg",msg);
		}else{
			if(bandto==null){
				System.out.println("정지안됨");
				List<LoanDTO> list = loanDao.loanList(mem_idx);
				String dateFormat="yyyy-MM-dd";
				SimpleDateFormat sdf=new SimpleDateFormat(dateFormat);
				for(int i=0; i<list.size(); i++){
					String sdDay = sdf.format(list.get(i).getLb_sd());
					list.get(i).setLb_sday(sdDay);
					String edDay = sdf.format(list.get(i).getLb_ed());
					list.get(i).setLb_eday(edDay);
				}
				session.setAttribute("dto", dto);
				mav = new ModelAndView("admin/loanbookManage/checkOut","dto",dto);
				mav.addObject("list",list);	
			}else{
				String msg = "정지된 회원입니다 대출 불가합니다.";
				mav = new ModelAndView("admin/adminMsg","msg",msg);
				mav.addObject("page","checkOut.ju");
			}
		}
		return mav;
	}
}
