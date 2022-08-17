package model.hibernate;

import java.sql.Date;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import web.booking.dao.DoctorDAOImpl;
import web.booking.dao.DoctorScheduleDAOImpl;
import web.booking.dao.PatientDAOImpl;
import web.booking.vo.Doctor;
import web.booking.vo.DoctorSchedule;
import web.booking.vo.Patient;

public class HibernateDaoTest {

	public static void main(String[] args) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.getCurrentSession();
		Transaction transaction = session.beginTransaction();
		
		DoctorDAOImpl doctorDAOImpl  = new DoctorDAOImpl(sessionFactory);
		Doctor doctor = new Doctor();
//		doctor.setDoctorId(2);
//		doctor.setDoctorName("AndyHibernate3");
//		doctor.setDoctorId(1);
//		System.out.println(doctorDAOImpl.selectDoctorNameById(1));
//		System.out.println(doctorDAOImpl.selectOne(doctor));
//		System.out.println(doctorDAOImpl.selectAll());
//		System.out.println(doctorDAOImpl.updateDr(doctor));

//		******************DoctorScheduleDAOImpl**********************************
		
		DoctorScheduleDAOImpl doctorScheduleDAOImpl = new DoctorScheduleDAOImpl(sessionFactory);
		
//		System.out.println(doctorScheduleDAOImpl.selectDoctorSchedule(Date.valueOf("2022-07-12"), Date.valueOf("2022-07-20"), 1));
//		DoctorSchedule doctorSchedule = new DoctorSchedule();
//		doctorSchedule.setDoctorId(1);
//		doctorSchedule.setDoctorAmpm("晚上");
//		doctorSchedule.setDoctorScheduleDate(Date.valueOf("2025-10-10"));
//		doctorSchedule.setDoctorStatus(0);
//		System.out.println(doctorScheduleDAOImpl.insert(doctorSchedule));
//		System.out.println(doctorScheduleDAOImpl.selectSerialNum(doctorSchedule));
//		System.out.println(doctorScheduleDAOImpl.update(doctorSchedule));
		
//		****************************PatientDAOImpl************************************
		PatientDAOImpl patientDAOImpl = new PatientDAOImpl(sessionFactory);
		Patient patient = new Patient();
		patient.setMemID("TGA004");
		patient.setPatientIdcard("C123456789");
		patient.setBookingDate(Date.valueOf("2026-10-10"));
		patient.setChart("HELLLLLLLLLLLLLLLLO");
//		patient.setAmPm("早");
//		patient.setDoctorId(1);
//		patient.setBookingNumber(103);
//		System.out.println(patientDAOImpl.insertBookingIntoPatient(patient));
//		patient.setCheckinCondition(1);
//		Patient patient2 = new Patient();
//		patient2.setPatientIdcard("A123456789");
//		System.out.println(patientDAOImpl.selectPatientByIdcard(patient2));
//		System.out.println(patientDAOImpl.selectPatientByIdcardAndCheckinCondition(patient));
//		System.out.println(patientDAOImpl.updatePatientCheckinConditionByBookingDate(patient));
//		System.out.println(patientDAOImpl.selectCountByDoctor(Date.valueOf("2025-10-10"), 1));
//		System.out.println(patientDAOImpl.selectPatientBymemID(patient));
//		System.out.println(patientDAOImpl.selectAll());
		System.out.println(patientDAOImpl.updateChart(patient));
		
		transaction.commit();
		session.close();
		HibernateUtil.closeSessionFactory();
	}
}
