#version 330 core
out vec4 FragColor;

in vec3 Normal;
in vec3 FragPos;

uniform vec3 viewPos;
uniform vec3 lightColor;
uniform vec3 lightPos;
uniform vec3 objColor;

void main()
 {

  // 环境光照
  float ambientStrength = 0.1;
  vec3 ambient = ambientStrength * lightColor;

  // 漫反射光照
  vec3 norm = normalize(Normal);
  vec3 lightDir = normalize(lightPos - FragPos);
  float diff = max(dot(norm,lightDir),0.0);
  vec3 diffuse = diff*lightColor;

  // 镜面反射关照
  float specularStrength = 0.7;
  vec3 viewDir = normalize(viewPos-FragPos);
  vec3 reflectDir = reflect(-lightDir,norm);
  float spec = pow(max(dot(viewDir,reflectDir),0.0),220);
  vec3 specular = specularStrength*spec*lightColor;

  vec3 result = (ambient + diffuse+specular)*objColor;
  FragColor = vec4(result,1.0);
}