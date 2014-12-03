#input period
#output json, average

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

if(period=="Day"){
query = "select date(c.timestamp),sum(c.quantity) from consumption c where c.user_oid="+1+" group by day(c.timestamp) order by c.timestamp ASC limit "+offset+","+row_count
}
if(period=="Month"){
query = "select monthname(c.timestamp),sum(c.quantity) from consumption c where c.user_oid="+1+" group by month(c.timestamp) order by c.timestamp ASC limit "+offset+","+row_count
}
if(period=="Week"){
query = "select week(c.timestamp),sum(c.quantity) from consumption c where c.user_oid="+1+" group by week(c.timestamp) order by c.timestamp ASC limit "+offset+","+row_count
}

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

	def sum = 0

    for (r in result){
    	//write json
    	jGenerator.writeStartObject()
	    jGenerator.writeStringField("timestamp", r[0].toString()) 
	 	jGenerator.writeNumberField("quantity", r[1])
	    jGenerator.writeEndObject()
	    sum = sum + r[1].toDouble()
	    //to compute average
	}


	if(result.size()!=0)
	{
		average = sum/result.size()
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

return ["json" : json, "average" : average]