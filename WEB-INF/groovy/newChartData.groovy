#input user
#output json

import groovy.sql.Sql;
import java.sql.Connection;
import com.webratio.rtx.db.DBTransaction;
import com.webratio.rtx.db.HibernateService;
import com.webratio.rtx.core.BeanHelper;
import com.fasterxml.jackson.core.JsonEncoding
import com.fasterxml.jackson.core.JsonFactory
import com.fasterxml.jackson.core.JsonGenerationException
import com.fasterxml.jackson.core.JsonGenerator
import com.fasterxml.jackson.databind.JsonMappingException
import java.io.OutputStream
import java.io.ByteArrayOutputStream

	
Connection conn = null
def databaseId = "db1"
def session = getDBSession(databaseId)
def query = null
def page = 1
def offset = (page - 1)*4
def row_count = 4

query = "select date(c.timestamp),sum(c.quantity) from consumption c where c.user_oid="+1+" group by day(c.timestamp) order by c.timestamp ASC"

def result=null
def jsonString = null

def ris=0
result = session.createSQLQuery(query).list()
def average = 0;

try {

    OutputStream out = new ByteArrayOutputStream()
    
    JsonFactory jfactory = new JsonFactory();

    /*** write to file ***/
    JsonGenerator jGenerator = jfactory.createJsonGenerator(out, JsonEncoding.UTF8);

    jGenerator.writeStartArray()


    for (r in result){
    	//write json
    	jGenerator.writeStartObject()
	    jGenerator.writeStringField("timestamp", r[0].toString()) 
	    //jGenerator.writeStringField("timestamp", r[0]) 
	 	jGenerator.writeNumberField("quantity", r[1])
	    jGenerator.writeEndObject()

	}

	jGenerator.writeEndArray()

    jGenerator.close()

    json = out.toString()

} catch (JsonGenerationException e) {

    e.printStackTrace();

} catch (JsonMappingException e) {

    e.printStackTrace();

} catch (IOException e) {

    e.printStackTrace();

}

commit(session)
println json
return ["json" : json]