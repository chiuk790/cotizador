import os
from typing import Optional
import boto3
from botocore.exceptions import ClientError


class StorageManager:

  def __init__(self):
    self.bucket_name = os.getenv("S3_BUCKET_NAME")
    self.region = os.getenv("AWS_REGION", "us-east-1")

    # Inicializar cliente solo si existen credenciales configuradas
    self.s3_client = boto3.client(
        "s3",
        aws_access_key_id=os.getenv("AWS_ACCESS_KEY_ID"),
        aws_secret_access_key=os.getenv("AWS_SECRET_ACCESS_KEY"),
        region_name=self.region,
    )

  def upload_file(self, file_path: str, object_name: str) -> bool:
    """Sube un archivo local hacia el bucket de Amazon S3."""
    try:
      self.s3_client.upload_file(file_path, self.bucket_name, object_name)
      return True
    except ClientError as e:
      print(f"Error uploading file to S3: {e}")
      return False

  def get_presigned_url(
      self, object_name: str, expiration: int = 3600
  ) -> Optional[str]:
    """Genera una URL firmada temporal para descargar/visualizar el archivo de forma segura."""
    try:
      response = self.s3_client.generate_presigned_url(
          "get_object",
          Params={"Bucket": self.bucket_name, "Key": object_name},
          ExpiresIn=expiration,
      )
      return response
    except ClientError as e:
      print(f"Error generating presigned URL: {e}")
      return None


# Instancia singleton para importación global en la app
storage_manager = StorageManager()