#version 330 core
out vec4 FragColor;

in vec3 Normal;
in vec3 FragPos;

//材质
struct Material{
  vec3 ambient;
  vec3 diffuse;
  vec3 specular;
  vec3 shininess;
};
uniform Material material;


//光照属性
struct Light{
  vec3 position;

  vec3 ambient;
  vec3 diffuse;
  vec3 specular;
};

uniform Light light;

uniform vec3 viewPos;
uniform vec3 lightColor;
uniform vec3 lightPos;
uniform vec3 objColor;


void main()
 {

  // 环境光照
  vec3 ambient = material.ambient* light.ambient;

  // 漫反射光照
  vec3 norm = normalize(Normal);
  vec3 lightDir = normalize(lightPos - FragPos);
  float diff = max(dot(norm,lightDir),0.0);
  vec3 diffuse = (diff*material.diffuse)*light.diffuse;

  // 镜面反射关照
  vec3 viewDir = normalize(viewPos-FragPos);
  vec3 reflectDir = reflect(-lightDir,norm);
  float spec = pow(max(dot(viewDir,reflectDir),0.0),220);
  vec3 specular = (spec*material.specular)*light.specular;

  vec3 result = (ambient + diffuse+specular);
  FragColor = vec4(result,1.0);
}