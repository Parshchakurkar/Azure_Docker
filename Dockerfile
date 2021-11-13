#using python as a base image
FROM python:3.8
#copy of all files in container current image
ADD launch.py .

#installing pip
#RUN install pip python
ADD requirement.txt .

#installing all requirements and dependencies
RUN pip install -r requirement.txt
#running file
CMD ["python", "./launch.py"]