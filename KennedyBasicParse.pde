/*

Basic Kennedy parsing example by Brendan Dawes for Processing.

Example of reading Kennedy data via a Kennedy exported CSV file and plotting moments onto a map.

Uses the Unfolding library for Processing 2.0 and OpenCSV library.

*/

import au.com.bytecode.opencsv.CSVReader;
import au.com.bytecode.opencsv.CSVWriter;

import java.io.FileReader;
import java.io.IOException;
import java.util.List;

import java.text.SimpleDateFormat;

import de.fhpotsdam.unfolding.*;
import de.fhpotsdam.unfolding.geo.*;
import de.fhpotsdam.unfolding.utils.*;
import de.fhpotsdam.unfolding.marker.*;

UnfoldingMap map;

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
	
	size(800, 600,P2D);
	chooseFileForProcessing();
  map = new UnfoldingMap(this);
  MapUtils.createDefaultEventDispatcher(this, map);

}

void draw() {

	map.draw();

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

void addLocation(float lat, float lon) {

  Location location = new Location(lat, lon);
  KennedyMarker marker = new KennedyMarker(location);
  map.addMarker(marker);

}

void openCSVFileForReading(String path) {

try {

    
   	reader = new CSVReader(new FileReader(path));
    reader.readNext(); //ignore first header row
   	String [] nextLine;
    while ((nextLine = reader.readNext()) != null) {
      if (nextLine[LATITUDE].equals("(null)") == false  && nextLine[LONGITUDE].equals("(null)") == false ) {

        float lat = Float.parseFloat(nextLine[LATITUDE]);
        float lon = Float.parseFloat(nextLine[LONGITUDE]);
        addLocation(lat,lon);

      }
    }

   	} catch (IOException e) {

    e.printStackTrace();

  }

}

