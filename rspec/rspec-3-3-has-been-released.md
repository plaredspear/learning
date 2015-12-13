# Rspec 3.3 has been released!

[Rspec 3.3 has been released!](http://rspec.info/blog/2015/06/rspec-3-3-has-been-released/)


Notable Changes

**Core: Unique IDs for every Example and Example Group**

이전에는 file location로 구별되었는데,

```Ruby
$ rspec spec/unit/baseball_spec.rb:23
```

3.3에서는 example과 example group에 unique ID가 부여되기 때문에
개별 테스트가 가능

```Ruby
$ rspec spec/unit/baseball_spec.rb[1:2,1:4]
```

위의 경우, 첫번째 top-level group의 2번째와 4번째를 실행합니다.

**Core: New --only-failures option**

fail한 케이스만 실행하는 옵션.

**Core: New --next-failure option**

전체를 실행하여 failure list를 확보한 뒤,
failure list에서 단계별로 실행하는 옵션

**Core: Stable Random Ordering**

RSpec은 shuffle을 사용하여 Random으로 순서를 정함.
테스트 케이스가 변경될 경우(subset을 테스트한다거나), random으로 순서가 바뀜.
만약 테스트가 서로 영향을 미칠 경우, fail 당시의 테스트 set을 다시 돌려야함(shuffle의 seed가 동일하도록 하기 위해).

3.3에서는 shuffle을 사용하지 않고, --seed 옵션으로 생성된 값들을 hash로 관리함.
subset(particular seed)에서도 동일한 순서를 유지하기 때문에 테스트에 용이.

**Core: Bisect**

테스트의 isolating을 지원하기 위함.
subset의 ordering을 변경하여 실행(다양한 조건의 subset을 만들어서).


**Core: Thread Safe let and subject**

이전에는 let이랑 subject가 Thread Safe하지 않았었음.
(synchronization 때문에 약간의 overhead가 있지만, config에서 disable할 수 있음)


**Expectations: New aggregrate_failures API**

기존에 여러 개의 독립적인 expectation이 있을 때, 두 가지 방법으로 처리할 수 있다.

example 당 하나씩:
```Ruby
RSpec.describe Client do
  let(:response) { Client.make_request }

  it "returns a 200 response" do
    expect(response.status).to eq(200)
  end

  it "indicates the response body is JSON" do
    expect(response.headers).to include("Content-Type" => "application/json")
  end

  it "returns a success message" do
    expect(response.body).to eq('{"message":"Success"}')
  end
end
```

하나의 example에 여러 개의 expectation:
```Ruby
RSpec.describe Client do
  it "returns a successful JSON response" do
    response = Client.make_request

    expect(response.status).to eq(200)
    expect(response.headers).to include("Content-Type" => "application/json")
    expect(response.body).to eq('{"message":"Success"}')
  end
end
```

하나의 example에 여러 개의 expectation을 처리하는 경우, 빠르지만 첫 번째 expectation이 fail할 경우 나머지의 결과는 알 수 없음.

RSpec 3.3에서는 하나의 example에서 중간에 abort하지 않고 여러 expectation을 처리할 수 있음.

```Ruby
RSpec.describe Client do
  it "returns a successful JSON response" do
    response = Client.make_request

    aggregate_failures "testing response" do
      expect(response.status).to eq(200)
      expect(response.headers).to include("Content-Type" => "application/json")
      expect(response.body).to eq('{"message":"Success"}')
    end
  end
end
```

```
1) Client returns a successful response
   Got 3 failures from failure aggregation block "testing reponse".
   # ./spec/client_spec.rb:5

   1.1) Failure/Error: expect(response.status).to eq(200)

          expected: 200
               got: 404

          (compared using ==)
        # ./spec/client_spec.rb:6

   1.2) Failure/Error: expect(response.headers).to include("Content-Type" => "application/json")
          expected {"Content-Type" => "text/plain"} to include {"Content-Type" => "application/json"}
          Diff:
          @@ -1,2 +1,2 @@
          -[{"Content-Type"=>"application/json"}]
          +"Content-Type" => "text/plain",
        # ./spec/client_spec.rb:7

   1.3) Failure/Error: expect(response.body).to eq('{"message":"Success"}')

          expected: "{\"message\":\"Success\"}"
               got: "Not Found"

          (compared using ==)
        # ./spec/client_spec.rb:8
```

간편히 쓰는 법

```Ruby
RSpec.describe Client, :aggregate_failures do
  it "returns a successful JSON response" do
    response = Client.make_request

    expect(response.status).to eq(200)
    expect(response.headers).to include("Content-Type" => "application/json")
    expect(response.body).to eq('{"message":"Success"}')
  end
end
```

모든 feature에 적용하는 방법
```Ruby
RSpec.configure do |c|
  c.define_derived_metadata do |meta|
    meta[:aggregate_failures] = true unless meta.key?(:aggregate_failures)
  end
end
```


**Expectations: Improved Failure Output**

- 향상된 failure messages
- 향상된 formatting for Time


**Mocks: Improved Failure Output**

RSpec::Mocks에서도 향상된 foratting for Time 적용
have_received는 실제 args와 함께 몇 번을 받았는지의 messages도 표시


**Mocks: Stubbing MyClass.new Verifies Against MyClass#initialize**

기존에는 verifying double이 new를 할 때, 어떤 arguments도 가질 수 있었음.

RSpec 3.3에서는 initialize 메서드를 사용하기에, 유의미한 argument만을 허용함.


**Rails: Generated scaffold routing specs now include PATCH spec**

Rails 4에서 PATCH를 지원하기 시작했는데, scaffold spec 생성 시에는 업데이트되지 않았었음(rspec에서는 2.14부터 PATCH를 지원했었음).


**Rails: New :job spec type**

Rails의 ActiveJob spec type을 추가할 수 있음.

