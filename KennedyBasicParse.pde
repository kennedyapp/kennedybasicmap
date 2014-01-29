import au.com.bytecode.opencsv.CSVReader;
import au.com.bytecode.opencsv.CSVWriter;

import java.io.FileReader;
import java.io.IOException;
import java.util.List;

import java.text.SimpleDateFormat;

CSVReader reader;

final int DATESTAMP = 0;

final int TIME_OF_DAY = 1;

final int FUZZY_TIME = 2;

final int CITY = 3;

final int LATITUDE = 4;

final int LONGITUDE = 5;

final int NOTE = 6;

final int WEATHER = 7;

final int NEWS_HEADLINE = 8;

final int NEWS_URI = 9;

final int ARTIST = 10;

final int SONG = 11;

final int ALBUM = 12;

final int VENUE = 13;

final int VENUE_ID = 14;

final int IMAGE_NAME = 15;

SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

void setup() {
	
	size(512, 512);
	chooseFileForProcessing();

}

void draw() {
	
}

void chooseFileForProcessing() {

	selectInput("Select a CSV file to process:", "fileSelected");

}

void fileSelected(File selection) {
  if (selection == null) {
    exit();
  } else {
    openCSVFileForReading(selection.getAbsolutePath());
  }
}

void openCSVFileForReading(String path) {

try {

   	reader = new CSVReader(new FileReader(path));
   	String [] nextLine;
    while ((nextLine = reader.readNext()) != null) {
      println("Date: " + nextLine[DATESTAMP] + "\nHeadline: " + nextLine[NEWS_HEADLINE] + "\nWeather: " + nextLine[WEATHER]);
    }

   	} catch (IOException e) {

    e.printStackTrace();

  }

}

