# musicindex
Music book index files
### Purpose
This repository contains indices for various real books and other items.   The files specifically target the [ForScore App]( https://apps.apple.com/us/app/forscore/id363738376).
### Notes
There are many demonstration videos online on how to associate an index file with a particular book in ForScore.
### Steps
* Copy the release zip file (or separately copy the individual files if you do not want all the indices).
* Put the .csv files into your ForScore App
   * Unfortunately, the current app (2/20/2018) will not allow you to pull down a .csv file from you cloud drive.
   * You will have to either email yourself the .csv files as attachments, then open the email/attachements on your device.  You should be given the option to "open with ForScore".  Doing that will put a copy of the index .csv in the "indexes" area (under bookmarks).
   * You could also webbrowse to a location where the .csv is publicly available.  Then same steps as above.
* In ForScore, open the book that the index will be associated with.
* Then select **bookmarks**, and **indexes** (top left on the drop down title bar).
* Select the index for the book.
* You will be presented with a configuration screen.
    * The image will be blank (until you configure the index)
    * The values area shown, (there may be 3 or 4 or more), as determined by how many .csv values there are in each line of the index file.
    * You have to tell the App, what each of the field values represent.
    * For most indexes contained here:
        * Value 1: Select: **Title**
        * Value 2: Select: **None** (the file name is not needed by ForScore)
        * Value 3: Select: **Start Page**
        * Value 4: Select: **End Page**
    * Now you will probably have to adjust the **Page number offset**
        * Usually the offset will need to be subtracted from the index page number. (e.g. Real Book 1 V6 starts on page 10, so you have to set -9 for the offset).  
        * The image will display the current page for the settings.  When you have the offset correct, the title will show the correct page.  You can check more by moving through the records with the arrows at the very bottom of the screen.
    * When everything is set up, select **Save** (upper right).
  
Note: The way this appears to work (2/20/2018), is the app uses the index.csv file to create a list of bookmarks for the current pdf file.  This is much better than the old way of having to create each bookmark by hand.

### Notes
* ForScore does not care what the field order is in the .csv files (unlike some other apps).  You tell it what each field means (from their list) when you configure the index bookmark creation.
* If you mess up, or want to reload an index file, or recreate an index.  You should delete all the bookmarks for the current pdf first.  Otherwise you will have duplicate bookmarks.  Also, sometimes the bookmark creation does not work correctly if you have clashes in the titles.
* Some index files out "in the wild" only have the start page listed for each title.  These will create "partial" (but usable) bookmarks. You can tell by the dotted circle next to each bookmark vs. a solid filled in circle.  The issue with partial bookmarks, you can search them by name, but you cannot add them to **setlists**. 
* To use **bookmarks** in a **setlist**, you have to have the **title**, **start page**, and **end page**.  That seems to be the minimum required for a usable bookmark.  You can tell if your bookmark is correct several ways:
    * If you select a song via a bookmark, the Title Bar on the app should show: **Your Song Title, p. 1 of n (Bookmark)**.  It should not show: **PDF Filename, p. x of yyy***
    * If you select the circled arrow next to the bookmark, you are presented with the configuration values for that bookmark.  If *To* is blank or has a red dot, the bookmark is not complete.

### Contributions ###
Pull Requests may be eventually welcomed.
### License ###
See the [LICENSE]() file.  

Note: I make no guarantees of the acuracy or completeness of the files contained here.  They have been constructed as accurately and quickly as possible, but mistakes are certainly a possibility.
