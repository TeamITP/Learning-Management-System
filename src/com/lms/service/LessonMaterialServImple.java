package com.lms.service;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Locale;
import java.util.logging.Level;

import javax.servlet.http.Part;

import com.azure.storage.blob.BlobContainerClient;
import com.azure.storage.blob.BlobServiceClient;
import com.azure.storage.blob.BlobServiceClientBuilder;
import com.azure.storage.blob.models.BlobErrorCode;
import com.azure.storage.blob.models.BlobStorageException;
import com.azure.storage.blob.specialized.BlockBlobClient;
import com.azure.storage.common.StorageSharedKeyCredential;
import com.lms.model.ReadingMaterial;
import com.lms.model.VideoMaterial;
import com.lms.util.ConnectDB;

public class LessonMaterialServImple implements LessonMaterialsService {

	private static Connection connection;
	private static PreparedStatement preparedStatement;
	private static Statement statement;
	
	@Override
	public int createReading(ReadingMaterial readingMaterial) {
		int status = 0;

		try {
			connection = ConnectDB.getDBConnection();

			String sql = "INSERT INTO Reading(Lesson_id, Classroom_id, Name, Description, Num_Views) VALUES(?, ?, ?, ?, 0)";

			preparedStatement = connection.prepareStatement(sql);

			preparedStatement.setString(1, readingMaterial.getLessonId());
			preparedStatement.setString(2, readingMaterial.getClassroomId());
			preparedStatement.setString(3, readingMaterial.getName());
			preparedStatement.setString(4, readingMaterial.getDescription());

			status = preparedStatement.executeUpdate();
			

			try {
				if (preparedStatement != null) {
					preparedStatement.close();
				}
				if (connection != null) {
					connection.close();
				}
			} catch (java.sql.SQLException e) {
				logger.log(Level.SEVERE, e.getMessage());
			}

		} catch (SQLException e) {
			logger.log(Level.SEVERE, e.getMessage());
			System.out.println(e.getMessage());
		}

		return status;
	}
	
	@Override
	public int insertPDFtoReading(ReadingMaterial readingMaterial) {
		int status = 0;

		try {
			connection = ConnectDB.getDBConnection();

			String s = "SELECT TOP 1 id FROM Reading WHERE Classroom_id = ? Order by id DESC";
			preparedStatement = connection.prepareStatement(s);
			preparedStatement.setString(1, readingMaterial.getClassroomId());
			
			ResultSet resultSet = preparedStatement.executeQuery();
			
			while (resultSet.next()) {
			String sql = "UPDATE Reading SET URL = ? WHERE id=?";

			preparedStatement = connection.prepareStatement(sql);

			preparedStatement.setString(1, readingMaterial.getPathLink());
			preparedStatement.setString(2, resultSet.getString(1));

			status = preparedStatement.executeUpdate();
			}

			try {
				if (preparedStatement != null) {
					preparedStatement.close();
				}
				if (connection != null) {
					connection.close();
				}
			} catch (java.sql.SQLException e) {
				logger.log(Level.SEVERE, e.getMessage());
			}

		} catch (SQLException e) {
			logger.log(Level.SEVERE, e.getMessage());
			System.out.println(e.getMessage());
		}

		return status;
	}

	@Override
	public ArrayList<ReadingMaterial> getListReadingMaterials(String lessonId) {
		ArrayList<ReadingMaterial> arrayList = new ArrayList<ReadingMaterial>();
		try {
			connection = ConnectDB.getDBConnection();

			String sql = "SELECT * FROM Reading WHERE Lesson_id = ?";

			preparedStatement = connection.prepareStatement(sql);

			preparedStatement.setString(1, lessonId);

			ResultSet resultSet = preparedStatement.executeQuery();
			
			while (resultSet.next()) {
				ReadingMaterial readingMaterial = new ReadingMaterial();
				readingMaterial.setReadingMatId(resultSet.getString(2));
				readingMaterial.setLessonId(resultSet.getString(3));
				readingMaterial.setClassroomId(resultSet.getString(4));
				readingMaterial.setName(resultSet.getString(5));
				readingMaterial.setDescription(resultSet.getString(6));
				readingMaterial.setPathLink(resultSet.getString(8));
				readingMaterial.setViews(resultSet.getInt(9));
				
				arrayList.add(readingMaterial);
			}
			
			try {
				if (preparedStatement != null) {
					preparedStatement.close();
				}
				if (connection != null) {
					connection.close();
				}
			} catch (java.sql.SQLException e) {
				logger.log(Level.SEVERE, e.getMessage());
			}

		} catch (SQLException e) {
			logger.log(Level.SEVERE, e.getMessage());
			System.out.println(e.getMessage());
		}

		return arrayList;
	}

	@Override
	public int deleteReadingMaterial(String materialId) {
		int status = 0;

		try {
			connection = ConnectDB.getDBConnection();
			String query = "SELECT URL FROM Reading WHERE Material_id = ?";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, materialId);
			
			ResultSet resultSet = preparedStatement.executeQuery();
			
			while (resultSet.next()) {
				deleteFromBlob(resultSet.getString(1));
			}
			

			String s = "DELETE FROM Reading WHERE Material_id = ?";
			preparedStatement = connection.prepareStatement(s);
			preparedStatement.setString(1, materialId);
			
			status = preparedStatement.executeUpdate();
			

			try {
				if (preparedStatement != null) {
					preparedStatement.close();
				}
				if (connection != null) {
					connection.close();
				}
			} catch (java.sql.SQLException e) {
				logger.log(Level.SEVERE, e.getMessage());
			}

		} catch (SQLException e) {
			logger.log(Level.SEVERE, e.getMessage());
			System.out.println(e.getMessage());
		}

		return status;
	}

	@Override
	public int insertVideo(VideoMaterial videoMaterial) {
		int status = 0;

		try {
			connection = ConnectDB.getDBConnection();

			String sql = "INSERT INTO Video(Lesson_id, Classroom_id, Name, Description, URL, Source) VALUES(?, ?, ?, ?, ?, 'YouTube')";

			preparedStatement = connection.prepareStatement(sql);

			preparedStatement.setString(1, videoMaterial.getLessonId());
			preparedStatement.setString(2, videoMaterial.getClassroomId());
			preparedStatement.setString(3, videoMaterial.getName());
			preparedStatement.setString(4, videoMaterial.getDescription());
			preparedStatement.setString(5, videoMaterial.getUrl());

			status = preparedStatement.executeUpdate();
		
			try {
				if (preparedStatement != null) {
					preparedStatement.close();
				}
				if (connection != null) {
					connection.close();
				}
			} catch (java.sql.SQLException e) {
				logger.log(Level.SEVERE, e.getMessage());
			}

		} catch (SQLException e) {
			logger.log(Level.SEVERE, e.getMessage());
			System.out.println(e.getMessage());
		}

		return status;
	}

	@Override
	public ArrayList<VideoMaterial> getListVideo(String lessonId) {
		ArrayList<VideoMaterial> arrayList = new ArrayList<VideoMaterial>();
		try {
			connection = ConnectDB.getDBConnection();

			String sql = "SELECT * FROM Video WHERE Lesson_id = ?";

			preparedStatement = connection.prepareStatement(sql);

			preparedStatement.setString(1, lessonId);

			ResultSet resultSet = preparedStatement.executeQuery();
			
			while (resultSet.next()) {
				VideoMaterial videoMaterial = new VideoMaterial();
				videoMaterial.setVideoMatId(resultSet.getString(2));
				videoMaterial.setLessonId(resultSet.getString(3));
				videoMaterial.setClassroomId(resultSet.getString(4));
				videoMaterial.setName(resultSet.getString(5));
				videoMaterial.setDescription(resultSet.getString(6));
				videoMaterial.setUrl(resultSet.getString(8));
				
				arrayList.add(videoMaterial);
			}
			
			try {
				if (preparedStatement != null) {
					preparedStatement.close();
				}
				if (connection != null) {
					connection.close();
				}
			} catch (java.sql.SQLException e) {
				logger.log(Level.SEVERE, e.getMessage());
			}

		} catch (SQLException e) {
			logger.log(Level.SEVERE, e.getMessage());
			System.out.println(e.getMessage());
		}

		return arrayList;
	}

	@Override
	public int deleteVideo(String materialId) {
		int status = 0;

		try {
			connection = ConnectDB.getDBConnection();

			String s = "DELETE FROM Video WHERE Material_id = ?";
			preparedStatement = connection.prepareStatement(s);
			preparedStatement.setString(1, materialId);
			
			status = preparedStatement.executeUpdate();

			try {
				if (preparedStatement != null) {
					preparedStatement.close();
				}
				if (connection != null) {
					connection.close();
				}
			} catch (java.sql.SQLException e) {
				logger.log(Level.SEVERE, e.getMessage());
			}

		} catch (SQLException e) {
			logger.log(Level.SEVERE, e.getMessage());
			System.out.println(e.getMessage());
		}

		return status;
	}

	@Override
	public int updateViewCount(String materialId) {
		int status = 0;

		try {
			connection = ConnectDB.getDBConnection();

			String s = "SELECT * FROM Reading WHERE Material_id = ?";
			preparedStatement = connection.prepareStatement(s);
			preparedStatement.setString(1, materialId);
			
			
			ResultSet resultSet = preparedStatement.executeQuery();
			
			while (resultSet.next()) {
			int count = resultSet.getInt(9) + 1;
			
			String sql = "UPDATE Reading SET Num_Views = ? WHERE Material_id=?";

			preparedStatement = connection.prepareStatement(sql);

			preparedStatement.setInt(1, count);
			preparedStatement.setString(2, materialId);

			status = preparedStatement.executeUpdate();
			}

			try {
				if (preparedStatement != null) {
					preparedStatement.close();
				}
				if (connection != null) {
					connection.close();
				}
			} catch (java.sql.SQLException e) {
				logger.log(Level.SEVERE, e.getMessage());
			}

		} catch (SQLException e) {
			logger.log(Level.SEVERE, e.getMessage());
			System.out.println(e.getMessage());
		}

		return status;
	}

	@Override
	public String uploadToBlob(Part part) {
		// TODO Auto-generated method stub
		String fileName = System.currentTimeMillis() + part.getSubmittedFileName();
		InputStream filecontent = null;

		    try {
		        filecontent = part.getInputStream();
		        
		        /*
		         * Use your Storage account's name and key to create a credential object; this is used to access your account.
		         */
		        StorageSharedKeyCredential credential = new StorageSharedKeyCredential("yrazurestorage", "QW+3tfMfq4NJJ/pxq6O3KPSA+NumMC+Uuj0WKK/fAEudLxj24MKvwBGvYoVW0Ja/PJ4VIh5/4f7NvTDh21VbHg==");

		        /*
		         * From the Azure portal, get your Storage account blob service URL endpoint.
		         * The URL typically looks like this:
		         */
		        String endpoint = String.format(Locale.ROOT, "https://%s.blob.core.windows.net", "yrazurestorage");
		       
		        BlobServiceClient blobServiceClient = new BlobServiceClientBuilder().endpoint(endpoint).credential(credential).buildClient();
		        
		        BlobContainerClient containerClient = null;
		        
		        /* Create a new container client */
		        try {
		            containerClient = blobServiceClient.createBlobContainer("reading");
		        } catch (BlobStorageException ex) {
		            // The container may already exist, so don't throw an error
		            if (!ex.getErrorCode().equals(BlobErrorCode.CONTAINER_ALREADY_EXISTS)) {
		                throw ex;
		            }
		        }
		        
		        containerClient = blobServiceClient.getBlobContainerClient("reading");

		        /*
		         * Create a client that references a to-be-created blob in your Azure Storage account's container.
		         * This returns a BlockBlobClient object that wraps the blob's endpoint, credential and a request pipeline
		         * (inherited from containerClient). Note that blob names can be mixed case.
		         */
		        BlockBlobClient blobClient = containerClient.getBlobClient(fileName).getBlockBlobClient();

		        /*
		         * Create the blob with string (plain text) content.
		         */
		        blobClient.upload(filecontent, part.getSize());
		        
		        filecontent.close();
		    } catch(Exception e) {
		    	e.printStackTrace();
		    }
		return fileName;
	}

	@Override
	public void deleteFromBlob(String fileName) {
		/*
         * Use your Storage account's name and key to create a credential object; this is used to access your account.
         */
        StorageSharedKeyCredential credential = new StorageSharedKeyCredential("yrazurestorage", "QW+3tfMfq4NJJ/pxq6O3KPSA+NumMC+Uuj0WKK/fAEudLxj24MKvwBGvYoVW0Ja/PJ4VIh5/4f7NvTDh21VbHg==");

        /*
         * From the Azure portal, get your Storage account blob service URL endpoint.
         * The URL typically looks like this:
         */
        String endpoint = String.format(Locale.ROOT, "https://%s.blob.core.windows.net", "yrazurestorage");
       
        BlobServiceClient blobServiceClient = new BlobServiceClientBuilder().endpoint(endpoint).credential(credential).buildClient();
        
        BlobContainerClient containerClient =  blobServiceClient.getBlobContainerClient("reading");

        /*
         * Create a client that references a to-be-created blob in your Azure Storage account's container.
         * This returns a BlockBlobClient object that wraps the blob's endpoint, credential and a request pipeline
         * (inherited from containerClient). Note that blob names can be mixed case.
         */
        BlockBlobClient blobClient = containerClient.getBlobClient(fileName).getBlockBlobClient();
        
        /*
         * Delete the blob we created earlier.
         */
        blobClient.delete();

	}

	@Override
	public ByteArrayOutputStream downloadFromBlob(String fileName) {
		System.out.println(fileName);
		
		/*
         * Use your Storage account's name and key to create a credential object; this is used to access your account.
         */
        StorageSharedKeyCredential credential = new StorageSharedKeyCredential("yrazurestorage", "QW+3tfMfq4NJJ/pxq6O3KPSA+NumMC+Uuj0WKK/fAEudLxj24MKvwBGvYoVW0Ja/PJ4VIh5/4f7NvTDh21VbHg==");

        /*
         * From the Azure portal, get your Storage account blob service URL endpoint.
         * The URL typically looks like this:
         */
        String endpoint = String.format(Locale.ROOT, "https://%s.blob.core.windows.net", "yrazurestorage");
       
        BlobServiceClient blobServiceClient = new BlobServiceClientBuilder().endpoint(endpoint).credential(credential).buildClient();
        
        BlobContainerClient containerClient =  blobServiceClient.getBlobContainerClient("reading");

        /*
         * Create a client that references a to-be-created blob in your Azure Storage account's container.
         * This returns a BlockBlobClient object that wraps the blob's endpoint, credential and a request pipeline
         * (inherited from containerClient). Note that blob names can be mixed case.
         */
        BlockBlobClient blobClient = containerClient.getBlobClient(fileName).getBlockBlobClient();
		
        /*
         * Download the blob's content to output stream.
         */
        int dataSize = (int) blobClient.getProperties().getBlobSize();
        ByteArrayOutputStream outputStream = new ByteArrayOutputStream(dataSize);
        blobClient.download(outputStream);
       
        
        try {
			outputStream.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
        return outputStream;
	}

}
