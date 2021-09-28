package com.mainframe.conversion;

import java.util.Iterator;

import org.json.JSONArray;
import org.json.JSONObject;

public class jsonParser {
	
	String result = "";
	
	public String getKey(JSONObject jsonObject, String key){
		boolean exists = jsonObject.has(key);
		Iterator<?> keys;
		String nextKeys;
		
		if (!exists){
			keys = jsonObject.keys();
			while(keys.hasNext()){
				nextKeys = (String) keys.next();
				try {
					if(jsonObject.get(nextKeys) instanceof JSONObject){
						if(exists == false){
							getKey(jsonObject.getJSONObject(nextKeys), key);
						}
					}else if(jsonObject.get(nextKeys) instanceof JSONArray){
						JSONArray jsonArray = jsonObject.getJSONArray(nextKeys);
						for (int i=0; i<jsonArray.length(); i++){
							String jsonArrayString = jsonArray.get(i).toString();
							JSONObject innerJson = new JSONObject(jsonArrayString);
							
							if(exists == false){
								getKey(innerJson, key);
							}
						}
					}
				} catch (Exception e) {
					// TODO: handle exception
				}
			}
		}else {
			//parseObject(jsonObject, key);
			result = jsonObject.get(key).toString();
		}
		return result;
	}
	
	public static void parseObject(JSONObject jsonObject, String key){
		System.out.println(jsonObject.get(key));
	}
}
