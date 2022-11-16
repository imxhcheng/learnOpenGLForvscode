#version 330 core
out vec4 FragColor;

in vec3 Normal;
in vec3 FragPos;

uniform vec3 objColor;
uniform vec3 lightColor;
uniform vec3 lightPos;

void main()
 {

  // 环境关照
  float ambientStrength = 0.1;
  vec3 ambient = ambientStrength * lightColor;

  vec3 norm = normalize(Normal);
  vec3 lightDir = normalize(lightPos - FragPos);

  // 漫反射光照
  float diff = max(dot(norm,lightDir),0.0);
  vec3 diffuse = diff*lightColor;

  vec3 result = (ambient + diffuse)*objColor;

  FragColor = vec4(result,1.0);
}