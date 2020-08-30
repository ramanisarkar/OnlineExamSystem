package DAO;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.AnnotationConfiguration;

import VO.ProfessorVo;
import VO.SemProfessorVo;
import VO.SubjectProfessorVo;

public class SubjectProfessorDao {

	public void insert(SubjectProfessorVo subjectprofessorvo) {
		try {
			SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
			Session session = sessionfactory.openSession();
			Transaction transaction = session.beginTransaction();
			session.save(subjectprofessorvo);
			transaction.commit();
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}


	public ArrayList<SubjectProfessorVo> SubjectProfessor(SubjectProfessorVo subjectProfessorVo) {
		List<SubjectProfessorVo> professorList = new ArrayList<SubjectProfessorVo>();
		try {
			SessionFactory sessionfactory = new AnnotationConfiguration().configure().buildSessionFactory();
			Session session = sessionfactory.openSession();
			Transaction transaction = session.beginTransaction();
			Query q = session.createQuery("from SubjectProfessorVo AS p where p.professorid =:id");
			q.setParameter("id", subjectProfessorVo.getProfrssorid());
			professorList = q.list();
			transaction.commit();
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return (ArrayList<SubjectProfessorVo>) professorList;
	}

}