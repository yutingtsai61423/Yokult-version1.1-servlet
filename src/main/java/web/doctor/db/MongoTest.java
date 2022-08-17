package web.doctor.db;
import static com.mongodb.client.model.Filters.eq;
import static com.mongodb.client.model.Sorts.ascending;
import static com.mongodb.MongoClientSettings.getDefaultCodecRegistry;
import static org.bson.codecs.configuration.CodecRegistries.fromProviders;
import static org.bson.codecs.configuration.CodecRegistries.fromRegistries;

import java.util.ArrayList;
import java.util.List;

import org.bson.Document;
import org.bson.codecs.configuration.CodecProvider;
import org.bson.codecs.configuration.CodecRegistry;
import org.bson.codecs.pojo.PojoCodecProvider;
import org.bson.conversions.Bson;
import org.bson.types.ObjectId;
import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.model.Projections;
import com.mongodb.client.model.Sorts;
import com.mongodb.client.result.InsertManyResult;
import com.mongodb.client.result.InsertOneResult;

import web.booking.vo.Patient;

public class MongoTest{
	public static void main(String[] args) {
	
	    // Replace the uri string with your MongoDB deployment's connection string
	    String uri = "mongodb+srv://vicky:tibame888@cluster0.sw4btkx.mongodb.net/?retryWrites=true&w=majority";
	     CodecProvider pojoCodecProvider = PojoCodecProvider.builder().automatic(true).build();
	     CodecRegistry pojoCodecRegistry = fromRegistries(getDefaultCodecRegistry(), fromProviders(pojoCodecProvider));

	    try (MongoClient mongoClient = MongoClients.create(uri)) {
	        MongoDatabase database = mongoClient.getDatabase("patient");
	        MongoCollection<Document> collection = database.getCollection("checkin");
//*********查詢************
    //得到document方式
	        Document doc = collection.find(eq("doctorId", 1)).sort(ascending("bookingNumber")).first();
	        System.out.println(doc);
    //得到VO方式
//	        MongoDatabase database = mongoClient.getDatabase("patient").withCodecRegistry(pojoCodecRegistry);
//	        MongoCollection<Patient> collection = database.getCollection("checkin", Patient.class);
//	        Patient patient = collection.find().sort(ascending("bookingNumber")).first();
//	        System.out.println(patient);
	
//	        Document doc = collection.find(eq("title", "Back to the Future")).first();
//	        System.out.println(doc.toJson());
	        
	        
//*************新增
    //insert one============
//	        Document doc1 = new Document("patientIdcard", "A123456789").append("bookingNumber", 1).append("doctorId", 1);
//	        InsertOneResult result = collection.insertOne(doc1);
//	        System.out.println("Inserted a document with the following id: " 
//	            + result.getInsertedId().asObjectId().getValue());
	        
	        
//	        //insert Many============
//	        List<Document> documents = new ArrayList<>();
//
//	        Document doc3 = new Document("color", "red").append("qty", 5);
//	        Document doc2 = new Document("color", "purple").append("qty", 10);
//
//	        documents.add(doc3);
//	        documents.add(doc2);
//
//	        InsertManyResult result2 = collection.insertMany(documents);
//
//	        List<ObjectId> insertedIds = new ArrayList<>();
//	        result2.getInsertedIds().values()
//	            .forEach(doc -> insertedIds.add(doc.asObjectId().getValue()));
//
//	        System.out.println("Inserted documents with the following ids: " + insertedIds);
	        
	        
//	        //select
//	        //資料排序後 找到目標並回傳
//	        
//	        //用projectionFields設定要回傳那些欄位 excludeId指的是不要回傳id的欄位
//            Bson projectionFields = Projections.fields(
//                    Projections.include("title", "imdb"),
//                    Projections.excludeId());
//	        
//            // 尋找title=The Room 的"title", "imdb"欄位 並寫依照imdb.rating排序.
//            //應用在select * from checkin order by asce bookingNumber limit1
//            //注意用到eq 要 import static com.mongodb.client.model.Filters.eq;
//            Document doc = collection.find(eq("title", "The Room"))
//                    .projection(projectionFields)
//                    .sort(Sorts.descending("imdb.rating"))
//                    .first();
//            
//            if (doc == null) {
//                System.out.println("No results found.");
//            } else {
//                System.out.println(doc.toJson());
//            }
	        
	        

	    }
	}
}