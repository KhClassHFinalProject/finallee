package ju.controller;

import java.text.SimpleDateFormat;
import java.util.*;
import ju.dto.*;
import ju.model.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class adminLearnigController {

	@Autowired
	public TeacherDAO teacherDao;
	
	
	@Autowired
	public SubjectDAO subjectDao;
	

	// 교육 메인페이지로 이동
		@RequestMapping("/learningList.ju")
		public ModelAndView learningList(){
			List<SubjectDTO> list = subjectDao.classList();
			String dateFormat="yyyy-MM-dd";
			SimpleDateFormat sdf=new SimpleDateFormat(dateFormat);
			for(int i=0; i<list.size(); i++){
				String sdDay = sdf.format(list.get(i).getSj_sd());
				list.get(i).setSj_sday(sdDay);
				String edDay = sdf.format(list.get(i).getSj_ed());
				list.get(i).setSj_eday(edDay);
			}
			ModelAndView mav = new ModelAndView("admin/learningManage/learningList","list",list);
			return mav;
		}
		
	// 강사 메인페이지로 이동
		@RequestMapping("/learningTeacherList.ju")
		public ModelAndView learningTeacherList(){
			List<TeacherDTO> list = teacherDao.teacherList();
			for(int i=0; i<list.size(); i++){
				String tc_idx = list.get(i).getTc_idx();
				int count = subjectDao.classNum(tc_idx);
				int result = subjectDao.classEnd(tc_idx);
				list.get(i).setTc_num(count);
				list.get(i).setTc_end(result);
			}
			ModelAndView mav = new ModelAndView("admin/learningManage/learningTeacherList","list",list);
			return mav;
			}
		
	// 수업 등록 폼으로 이동
		@RequestMapping(value="/learningClassAdd.ju",method=RequestMethod.GET)
		public ModelAndView classAddForm(){
			List<TeacherDTO> list = teacherDao.teacherList();
			ModelAndView mav = new ModelAndView("admin/learningManage/learningClassAdd","list",list);
			return mav;
		}
		
	// 수업 등록하기
		@RequestMapping(value="/learningClassAdd.ju",method=RequestMethod.POST)
		public ModelAndView classAdd(
				@ModelAttribute("dto") SubjectDTO dto){
			Long unixTime=System.currentTimeMillis();
			String sj_idx="SJ"+unixTime;
			dto.setSj_idx(sj_idx);
			int result = subjectDao.classAdd(dto);
			String msg = result>0?"수업 등록":"수업 등록 실패";
			ModelAndView mav = new ModelAndView("admin/adminMsg","msg",msg);
			mav.addObject("page","learningList.ju");
			return mav;
		}
	
	// 강사 등록 폼으로 이동
		@RequestMapping(value="/learningTeacherAdd.ju",method=RequestMethod.GET)
		public ModelAndView teacherAddForm(){
			ModelAndView mav = new ModelAndView("admin/learningManage/learningTeacherAdd");
			return mav;
		}
	
		
	// 강사 등록하기
		@RequestMapping(value="/learningTeacherAdd.ju",method=RequestMethod.POST)
		public ModelAndView teacherAdd(
				@ModelAttribute("dto") TeacherDTO dto){
			Long unixTime=System.currentTimeMillis();
			String tc_idx="TC"+unixTime;
			dto.setTc_idx(tc_idx);
			int result = teacherDao.teacherAdd(dto);
			String msg = result>0?"강사 등록":"강사 등록 실패";
			ModelAndView mav = new ModelAndView("admin/adminMsg","msg",msg);
			mav.addObject("page","learningTeacherList.ju");
			return mav;
		}
		
		// 학생들 정보
		@RequestMapping(value="/memberCheck.ju", method=RequestMethod.POST)
		public ModelAndView memberCheck(String sj_idx){	
			List<SubjectDTO> list = subjectDao.memberCheck(sj_idx);
			ModelAndView mav = new ModelAndView("admin/learningManage/learningInfo","list",list);
			
			return mav;
		}
	

	// 선생님별 수업정보 가져오는 것
		@RequestMapping("/teacherInfo.ju")
		public ModelAndView teacherInfo(String tc_idx){
			List<SubjectDTO> list = subjectDao.teacherInfo(tc_idx);
			String dateFormat="yyyy-MM-dd";
			SimpleDateFormat sdf=new SimpleDateFormat(dateFormat);
			for(int i=0; i<list.size(); i++){
				String sdDay = sdf.format(list.get(i).getSj_sd());
				list.get(i).setSj_sday(sdDay);
				String edDay = sdf.format(list.get(i).getSj_ed());
				list.get(i).setSj_eday(edDay);
			}
			
			ModelAndView mav = new ModelAndView("admin/learningManage/learningTeacherInfo","list",list);
			return mav;
		}
}
