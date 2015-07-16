Written by Craig Warner

Image located at https://github.com/craigmwarner1/Comp-Org-Image.git

TO INSTALL
==========

In the terminal:

docker pull bereacollege/csc335_computer_organization


Kitematic on Windows:

Search for bereacollege/csc335_computer_organization
Click "Create" 


IMPORTANT: MAPPING STORAGE
==========================

Note: If you fail to map the VOLUME's to local directories in the Kitematic application before writing files, you may lose the work saved within those directories if you map them at a later date.

Instructions:

After creating a new container, highlight the container and navigate to the "Volumes" section of the Kitematic application. Here, the Volumes mounted to the container will be displayed. Highlight and "Add" them to the desired folders on your machine. 

The files you store in these Volumes while using the container will now be accessable in the folders you "Add"ed them to locally through the Kitematic application.

Again, don't forget that any files in a directory in the container will be deleted if that directory is remapped to a different location on the local machine.

An empty "GoogleDrive" folder is included in the root directory of the container. If you use Google Drive on the local machine and would like to store files from within the container in your Google Drive, this is the recommended folder to which you should map that. However, this is not necessary.

Note: Keep in mind that whatever local destination these Volumes are mapped to will give access within the container to all contents of that folder as well. 


HOW TO USE:
===========

If you are new to Kitematic and have questions about how to use it, their documentation is located at: https://kitematic.com/docs/

In the Kitematic application, search for *FILL IN*. You will select this repository, and your computer will build a local image based off of the repository that you can then spin up. Once you have a container, you have the options Start, Stop, Restart, Remove. 
	Start - Makes the container live, allowing you to access and use it.
	Stop - Kills the container, saving its state and turning it off.
	Restart - Stops and then restarts the container, maintaining state.
	Remove - Removes the container from memory, undoing any mapping and deleting its current state.
Unless you need to completely wipe the container, in most cases it will be best for you to simply Stop and Start the container, as spinning new containers will require you to remap the directories in the Kitematic application.

After spinning up a new container, make sure not to forget to appropriately map the container's Volumes to local storage. 

Running containers can be connected to through a web browser. To do this, click on the Settings tab in the Kitematic app, and click on the IP Address provided. This will open the container on your default browser. When the page is loaded, the image of the container will be statically sized to match the viewport it is loaded in. The resolution of the image cannot be changed. If you need to resized the container, you will have to Remove it and spin up a new one in a window that is the desired size. 
