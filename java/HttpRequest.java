package com.znblog.weekreports;

import org.json.simple.JSONObject;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2016/8/16.
 */
public class HttpRequest {
    public static final String ADD_URL = "http://zousitanghulu.com/Table/JsonSQL/AddNewOrder2.php";

    public static void appadd() {
        try {
            //创建连接
            URL url = new URL(ADD_URL);
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setDoOutput(true);
            connection.setDoInput(true);
            connection.setRequestMethod("POST");
            connection.setUseCaches(false);
            connection.setInstanceFollowRedirects(true);
            connection.setRequestProperty("Content-Type",
                    "application/x-www-form-urlencoded");

            connection.connect();

            //POST请求
            DataOutputStream out = new DataOutputStream(connection.getOutputStream());

            Map<String,Object> map=new HashMap<String, Object>();
            map.put("Client","1");
            map.put("Receiver","张三");
            map.put("Address","杭州下沙");
            map.put("Phone","1383838438");
            map.put("Price","200");
            Map<String,String> Food=new HashMap<String, String>();
            Map<String,String> Food2=new HashMap<String, String>();
            List<Map> Foods=new ArrayList<Map>();
            Food.put("ID","1");
            Food.put("Num","1");
            Food2.put("ID","1");
            Food2.put("Num","1");
            Foods.add(Food);
            Foods.add(Food2);
            map.put("Food",Foods);

            JSONObject obj = new JSONObject(map);

            out.writeBytes(obj.toString());
            out.flush();
            out.close();

            //读取响应
            BufferedReader reader = new BufferedReader(new InputStreamReader(
                    connection.getInputStream()));
            String lines;
            StringBuffer sb = new StringBuffer("");
            while ((lines = reader.readLine()) != null) {
                lines = new String(lines.getBytes(), "utf-8");
                sb.append(lines);
            }
            System.out.println(sb);
            reader.close();
            // 断开连接
            connection.disconnect();
        } catch (MalformedURLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (UnsupportedEncodingException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

    }

    public static void main(String[] args) {
        appadd();
    }
}
